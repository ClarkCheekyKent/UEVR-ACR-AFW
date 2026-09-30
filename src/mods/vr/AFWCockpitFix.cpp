#include "AFWCockpitFix.hpp"
#include <d3d12.h>
#include <wrl/client.h>
#include <SafetyHook.hpp>
#include <spdlog/spdlog.h>
#include <atomic>
#include <mutex>
#include <vector>
#include <cstring>
#include <array>
#include <algorithm>
#include <cmath>
#include <fstream>
#include <filesystem>

namespace afw_cockpit {
namespace {
using Microsoft::WRL::ComPtr;
#include "cockpit_shaders/original42.inc"
#include "cockpit_shaders/patched42.inc"
struct ShaderBytes {const void* data;size_t size;};
#include "cockpit_shaders/original47.inc"
std::array<ShaderBytes,5> history_shader47{};
#include "cockpit_shaders/original50.inc"
std::array<ShaderBytes,5> history_shader50{};
#include "cockpit_shaders/original51.inc"
std::array<ShaderBytes,5> history_shader51{};
#include "cockpit_shaders/original52.inc"
std::array<ShaderBytes,5> history_shader52{};

std::vector<unsigned char> history_blob;
std::atomic_bool shaders_ready{false};
bool load_history_shaders(){
    if(shaders_ready.load())return true;
    HMODULE module{};wchar_t path[32768]{};
    if(!GetModuleHandleExW(GET_MODULE_HANDLE_EX_FLAG_FROM_ADDRESS|GET_MODULE_HANDLE_EX_FLAG_UNCHANGED_REFCOUNT,
        reinterpret_cast<LPCWSTR>(&load_history_shaders),&module)||!GetModuleFileNameW(module,path,32768))return false;
    std::ifstream file(std::filesystem::path(path).parent_path()/L"AFWHistoryShaders.bin",std::ios::binary|std::ios::ate);
    if(!file)return false;
    const auto length=file.tellg();if(length<172||length>100000000)return false;
    std::vector<unsigned char> bytes(static_cast<size_t>(length));file.seekg(0);if(!file.read(reinterpret_cast<char*>(bytes.data()),length))return false;
    UINT count{};std::memcpy(&count,bytes.data()+8,4);if(count!=20||std::memcmp(bytes.data(),"AFWHRNG1",8))return false;
    for(UINT i=0;i<count;i++){UINT offset{},size{};std::memcpy(&offset,bytes.data()+12+i*8,4);std::memcpy(&size,bytes.data()+16+i*8,4);
        if(offset<172||size<4||size>bytes.size()||offset>bytes.size()-size||std::memcmp(bytes.data()+offset,"DXBC",4))return false;}
    history_blob=std::move(bytes);
    std::array<ShaderBytes,5>* banks[]{&history_shader47,&history_shader50,&history_shader51,&history_shader52};
    for(UINT i=0;i<count;i++){UINT offset{},size{};std::memcpy(&offset,history_blob.data()+12+i*8,4);std::memcpy(&size,history_blob.data()+16+i*8,4);(*banks[i/5])[i%5]={history_blob.data()+offset,size};}
    shaders_ready.store(true);
    return true;
}

std::atomic_bool enabled{false};
std::atomic_bool history_enabled{false};
std::atomic_int history_range{2}, applied_range{-1};
std::atomic_uint history_ready_bits{0};
std::atomic_uint64_t history_depth_bindings{0}, history_color_bindings{0};
std::atomic_int history_selection{-1};
std::atomic_uint history_pipelines{0};
std::atomic_uint64_t history_bindings{0};
std::atomic_int last_selection{-1}; // -1: not observed, 0: original, 1: replacement
std::atomic_uint matched_pipelines{0};
std::atomic_uint64_t patched_bindings{0};
std::atomic_long last_error{S_OK};
std::atomic_bool create_hook_ready{false}, bind_hook_ready{false};
safetyhook::InlineHook create_hook, bind_hook;
struct Pair {ComPtr<ID3D12PipelineState> original, replacement;std::array<ComPtr<ID3D12PipelineState>,5> history_variants;int shader{};};
std::mutex pairs_mutex;
std::vector<Pair> pairs; // Retain both PSOs for in-flight command lists and pointer identity.
thread_local ID3D12GraphicsCommandList* active_list=nullptr;
thread_local bool frame_enabled=false;
thread_local int frame_selection=-1;
thread_local bool frame_history_enabled=false;
thread_local int frame_history_selection=-1, frame_range=2;

HRESULT STDMETHODCALLTYPE create_pipeline(ID3D12Device* device,const D3D12_COMPUTE_PIPELINE_STATE_DESC* desc,REFIID iid,void** output) {
    const auto hr=create_hook.call<HRESULT>(device,desc,iid,output);
    if(FAILED(hr)||!desc||!output||!*output||!desc->CS.pShaderBytecode)return hr;
    const unsigned char* replacement=nullptr;size_t replacement_size=0;const ShaderBytes* variants=nullptr;int shader=42;
    if(desc->CS.BytecodeLength==sizeof(original_shader42) && std::memcmp(desc->CS.pShaderBytecode,original_shader42,sizeof(original_shader42))==0){replacement=patched_shader42;replacement_size=sizeof(patched_shader42);}
    if(desc->CS.BytecodeLength==sizeof(original_shader47) && std::memcmp(desc->CS.pShaderBytecode,original_shader47,sizeof(original_shader47))==0){variants=history_shader47.data();shader=47;}
    if(desc->CS.BytecodeLength==sizeof(original_shader50) && std::memcmp(desc->CS.pShaderBytecode,original_shader50,sizeof(original_shader50))==0){variants=history_shader50.data();shader=50;}
    if(desc->CS.BytecodeLength==sizeof(original_shader51) && std::memcmp(desc->CS.pShaderBytecode,original_shader51,sizeof(original_shader51))==0){variants=history_shader51.data();shader=51;}
    if(desc->CS.BytecodeLength==sizeof(original_shader52) && std::memcmp(desc->CS.pShaderBytecode,original_shader52,sizeof(original_shader52))==0){variants=history_shader52.data();shader=52;}
    if(!replacement&&!variants)return hr;
    Pair p;p.shader=shader;
    auto status=static_cast<IUnknown*>(*output)->QueryInterface(IID_PPV_ARGS(&p.original));
    if(SUCCEEDED(status)) {
        auto patched=*desc;
        patched.CachedPSO={}; // Original cached code cannot describe the replacement shader.
        if(variants) {
            for(int i=0;i<5&&SUCCEEDED(status);++i){
                patched.CS={variants[i].data,variants[i].size};
                status=create_hook.call<HRESULT>(device,&patched,__uuidof(ID3D12PipelineState),reinterpret_cast<void**>(p.history_variants[i].GetAddressOf()));
            }
        } else {
            patched.CS={replacement,replacement_size};
            status=create_hook.call<HRESULT>(device,&patched,__uuidof(ID3D12PipelineState),reinterpret_cast<void**>(p.replacement.GetAddressOf()));
        }
    }
    last_error=status;
    if(SUCCEEDED(status)) {
        std::lock_guard lock(pairs_mutex);pairs.push_back(std::move(p));if(variants){++history_pipelines;history_ready_bits.fetch_or(1u<<(shader-47));}else ++matched_pipelines;
        spdlog::info("[AFW motion compensation] shader {} original/replacement PSOs ready",shader);
    } else spdlog::error("[AFW motion compensation] replacement PSO failed {:08x}; keeping original",unsigned(status));
    return hr; // Never change the plugin's creation result or returned original object.
}
void STDMETHODCALLTYPE bind_pipeline(ID3D12GraphicsCommandList* cmd,ID3D12PipelineState* state) {
    ID3D12PipelineState* chosen=state;
    if(cmd==active_list) {
        std::lock_guard lock(pairs_mutex);
        for(auto& p:pairs)if(p.original.Get()==state) {
            const bool history=p.shader!=42;
            const unsigned ready=history_ready_bits.load();
            const bool paired=(ready&((1u<<0)|(1u<<5))) && (ready&((1u<<3)|(1u<<4)|(1u<<5)));
            bool use=history?(frame_history_enabled&&paired):frame_enabled;
            const int variant=frame_range;
            chosen=use?(history?p.history_variants[variant].Get():p.replacement.Get()):state;
            if(history){frame_history_selection=use?1:0;if(use){++history_bindings;applied_range=frame_range;
                if(p.shader==47||p.shader==52)++history_depth_bindings;
                if(p.shader!=47)++history_color_bindings;}}
            else{frame_selection=use?1:0;if(use)++patched_bindings;}
            break;
        }
    }
    bind_hook.call<void>(cmd,chosen);
}
bool supported_game() {
    const auto* image=reinterpret_cast<const unsigned char*>(GetModuleHandleW(L"acr.exe"));
    if(!image||image!=reinterpret_cast<const unsigned char*>(GetModuleHandleW(nullptr)))return false;
    const auto* dos=reinterpret_cast<const IMAGE_DOS_HEADER*>(image);
    if(dos->e_magic!=IMAGE_DOS_SIGNATURE||dos->e_lfanew<=0||dos->e_lfanew>0x100000)return false;
    const auto* pe=reinterpret_cast<const IMAGE_NT_HEADERS64*>(image+dos->e_lfanew);
    return pe->Signature==IMAGE_NT_SIGNATURE&&pe->FileHeader.Machine==IMAGE_FILE_MACHINE_AMD64&&
        pe->FileHeader.TimeDateStamp==0x050dbf19&&pe->OptionalHeader.SizeOfImage==0x0c143000;
}
} // private hook state

bool default_enabled() {
    return supported_game(); // Preserve Rally defaults; other games opt in per profile.
}

int cutoff_index(float value) {
    if(!std::isfinite(value))return 2;
    int nearest=0;
    for(int i=1;i<5;++i)if(std::abs(value-cutoff_values[i])<std::abs(value-cutoff_values[nearest]))nearest=i;
    return nearest;
}
void configure(bool moving_history,bool compensate,float cutoff) {
    enabled=moving_history;history_enabled=compensate;history_range=cutoff_index(cutoff);
}
Status status() {
    Status result;
    result.supported_game=supported_game();result.shaders_ready=shaders_ready.load();
    result.mask_selection=last_selection.load();result.history_selection=history_selection.load();result.applied_cutoff=applied_range.load();
    result.mask_pipelines=matched_pipelines.load();result.history_pipelines=history_pipelines.load();
    result.mask_selections=patched_bindings.load();result.depth_selections=history_depth_bindings.load();result.color_selections=history_color_bindings.load();result.error=last_error.load();
    return result;
}
void install_device(ID3D12Device* device) {
    if(create_hook_ready||!device)return;
    if(!load_history_shaders()){last_error=HRESULT_FROM_WIN32(ERROR_FILE_NOT_FOUND);spdlog::error("[AFW motion compensation] missing/invalid AFWHistoryShaders.bin beside backend");return;}
    auto address=(*reinterpret_cast<void***>(device))[11]; // ID3D12Device::CreateComputePipelineState
    auto hook=safetyhook::InlineHook::create(address,reinterpret_cast<void*>(&create_pipeline));
    if(hook){create_hook=std::move(hook.value());create_hook_ready=true;}
    else {last_error=E_FAIL;spdlog::error("[AFW motion compensation] compute creation hook failed");}
}
void install_command(ID3D12GraphicsCommandList* cmd) {
    if(bind_hook_ready||!cmd)return;
    auto address=(*reinterpret_cast<void***>(cmd))[25]; // ID3D12GraphicsCommandList::SetPipelineState
    auto hook=safetyhook::InlineHook::create(address,reinterpret_cast<void*>(&bind_pipeline));
    if(hook){bind_hook=std::move(hook.value());bind_hook_ready=true;}
    else {last_error=E_FAIL;spdlog::error("[AFW motion compensation] pipeline selection hook failed");}
}
EvaluationScope::EvaluationScope(ID3D12GraphicsCommandList* command) {
    previous_list=active_list;previous_mask=frame_enabled;previous_history=frame_history_enabled;
    previous_mask_selection=frame_selection;previous_history_selection=frame_history_selection;previous_range=frame_range;
    active_list=command;frame_enabled=enabled.load();frame_selection=-1;
    frame_history_enabled=history_enabled.load();frame_history_selection=-1;
    frame_range=std::clamp(history_range.load(),0,4);
}
EvaluationScope::~EvaluationScope() {
    last_selection=frame_selection;history_selection=frame_history_selection;
    active_list=previous_list;frame_enabled=previous_mask;frame_history_enabled=previous_history;
    frame_selection=previous_mask_selection;frame_history_selection=previous_history_selection;frame_range=previous_range;
}
} // afw_cockpit
