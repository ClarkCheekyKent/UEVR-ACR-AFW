#pragma once
#include "AFWPrimitiveHistoryPolicy.hpp"
#include "AFWCarObjects.hpp"
#include <windows.h>
#include <imgui.h>
#include <spdlog/spdlog.h>
#include <cstring>
#include <vector>
#include <safetyhook.hpp>
#include <algorithm>
#include <atomic>
#include <mutex>
#include <unordered_map>

// ACR executable-specific compatibility repair. Layout and code guards are
// deliberately strict: an updated game must be revalidated, not guessed at.
namespace afw_primitive_history {
inline SafetyHookInline uniform_hook;
inline std::atomic<bool> requested{true}, active{false};
inline std::atomic<uint64_t> matched{}, applied{}, fallback{}, changed{};
inline std::mutex mutex;
struct Key {
    uintptr_t scene{}, info{}, proxy{};
    uint32_t id{};
    bool operator==(const Key&) const = default;
};
struct KeyHash {
    size_t operator()(const Key& k) const { return (k.scene >> 4) ^ (k.info >> 4) ^ (k.proxy >> 3) ^ k.id; }
};
inline std::unordered_map<Key, History, KeyHash> histories;
inline std::vector<uintptr_t> components;
inline afw_car_objects::Handle tracked_pawn;
inline uintptr_t tracked_world{};
inline std::string status{"Waiting for supported ACR executable"};
inline bool attempted{}, supported{};
inline uint64_t ticks{};

template<class T> T read(const void* p, size_t offset = 0) {
    T v; std::memcpy(&v, static_cast<const uint8_t*>(p)+offset, sizeof(v)); return v;
}
// Native signature established from the caller and all six output arguments.
// The original getter writes bookkeeping and other flags; retain that behavior.
inline void uniform_parameters(void* scene, void* info, bool* volumetric,
    Matrix* previous, int32_t* capture_index, bool* output_velocity) {
    uniform_hook.unsafe_call<void>(scene, info, volumetric, previous, capture_index, output_velocity);
    if (!active.load(std::memory_order_acquire) || !info || !previous || !output_velocity) return;
    const auto proxy = read<uintptr_t>(info, 8);
    if (!proxy) return;
    const auto component = read<uintptr_t>((void*)proxy, 0x228);
    std::lock_guard lock(mutex);
    if (!active.load(std::memory_order_relaxed) ||
        !std::binary_search(components.begin(), components.end(), component)) return;
    // Cross-check both directions, using only render-owned objects here.
    if (read<uintptr_t>((void*)proxy, 0x1f0) != (uintptr_t)scene ||
        read<uintptr_t>((void*)proxy, 0x1f8) != (uintptr_t)info) return;
    ++matched;
    const Key key{(uintptr_t)scene, (uintptr_t)info, proxy, read<uint32_t>(info, 0x10)};
    const auto frame = read<uint64_t>(scene, 0x4838);
    const auto current = read<Matrix>((void*)proxy, 0xe0);
    if (histories.size() >= 512 && !histories.contains(key)) histories.clear();
    Matrix result{};
    if (!histories[key].update(frame, current, *previous, result)) { ++fallback; return; }
    ++applied;
    if (result != *previous && changed.fetch_add(1)==0) {
        SPDLOG_INFO("[AFW primitive history] first changed car matrix: primitive={} scene_frame={} age=2",key.id,frame);
    }
    *previous = result;
    // Preserve velocity requested for other reasons; include the extra history
    // interval when the car has just stopped and native one-frame motion is zero.
    for (size_t i=0; i<16; ++i) if (std::abs(current[i]-result[i]) > 1e-8) {
        *output_velocity = true; break;
    }
}

inline bool install() {
    if (attempted) return supported;
    std::lock_guard lock(mutex);
    attempted = true;
    auto* base = (uint8_t*)GetModuleHandleW(L"acr.exe");
    if (!base || base != (uint8_t*)GetModuleHandleW(nullptr)) return false;
    auto* dos = (IMAGE_DOS_HEADER*)base;
    auto* nt = (IMAGE_NT_HEADERS64*)(base+dos->e_lfanew);
    // Timestamp and image size from the executable used for the native audit.
    const uint8_t prologue[]{0x4c,0x8b,0xdc,0x53,0x55,0x56,0x57,0x41,0x56,0x41,0x57,0x48,0x81,0xec,0xd8,0,0,0};
    const uint8_t wrapper[]{0x8b,0x52,0x10,0x48,0x81,0xc1,0x38,0x48,0,0};
    const uint8_t lookup_call[]{0xe8,0x42,0xf5,0xff,0xff};
    if (nt->Signature != IMAGE_NT_SIGNATURE || nt->FileHeader.TimeDateStamp != 0x050dbf19 ||
        nt->OptionalHeader.SizeOfImage != 0x0c143000 ||
        std::memcmp(base+0x2c76340,prologue,sizeof(prologue)) ||
        std::memcmp(base+0x2c76250,wrapper,sizeof(wrapper)) ||
        std::memcmp(base+0x2c76429,lookup_call,sizeof(lookup_call))) {
        status = "ACR version/code mismatch: repair disabled";
        SPDLOG_WARN("[AFW primitive history] {}",status); return false;
    }
    // Publish the trampoline before enabling the hook on other engine threads.
    uniform_hook = safetyhook::create_inline(base+0x2c76340, (void*)&uniform_parameters,
        safetyhook::InlineHook::StartDisabled);
    if (!uniform_hook) { status="Could not install primitive history repair"; return false; }
    if (!uniform_hook.enable()) { status="Could not enable primitive history repair"; return false; }
    supported=true;
    status="Installed; waiting for car";
    SPDLOG_INFO("[AFW primitive history] native shader-parameter repair installed at {:x}",(uintptr_t)base+0x2c76340);
    return true;
}

inline void deactivate() {
    active.store(false, std::memory_order_release);
    std::lock_guard lock(mutex);
    histories.clear();
}
// UObject/reflection access stays on the game thread. The rendering hook only
// compares published component identities and accesses its native arguments.
inline void tick(sdk::UObject* engine, bool allow) {
    if (!install()) return;
    ++ticks;
    if (!allow || !requested.load()) { deactivate(); return; }
    auto* world = engine ? ((sdk::UEngine*)engine)->get_world() : nullptr;
    auto* sc = sdk::UGameplayStatics::static_class();
    auto* statics = sc ? sc->get_class_default_object<sdk::UGameplayStatics>() : nullptr;
    auto* pc = world && statics ? statics->get_player_controller((sdk::UObject*)world,0) : nullptr;
    auto* pawn = pc ? afw_car_objects::object_field(pc,L"AcknowledgedPawn") : nullptr;
    auto* interior = pawn ? afw_car_objects::object_field(pawn,L"InternalMesh") : nullptr;
    if (!interior || !afw_car_objects::has_class(interior,L"SkeletalMeshComponent") ||
        !afw_car_objects::owned_by(interior,pawn)) {
        deactivate();
        std::lock_guard lock(mutex); components.clear(); tracked_pawn={}; status="Waiting for car InternalMesh";
        return;
    }
    const bool new_car = pawn != afw_car_objects::resolve(tracked_pawn) || tracked_world != (uintptr_t)world;
    if (new_car || components.empty() || ticks%120==0) {
        std::vector<uintptr_t> selected;
        auto* array=sdk::FUObjectArray::get();
        for (int i=0; array && i<array->get_object_count(); ++i) {
            auto* item=array->get_object(i);
            auto* obj=item ? (sdk::UObject*)item->object : nullptr;
            if (!obj || obj->is_pending_kill_or_unreachable() || obj->get_outer()!=pawn) continue;
            if (afw_car_objects::has_class(obj,L"MeshComponent")) selected.push_back((uintptr_t)obj);
        }
        std::sort(selected.begin(),selected.end());
        std::lock_guard lock(mutex);
        if (new_car || components!=selected) {
            histories.clear(); components=std::move(selected);
            tracked_pawn=afw_car_objects::handle(pawn); tracked_world=(uintptr_t)world;
            SPDLOG_INFO("[AFW primitive history] selected {} car mesh components",components.size());
        }
        status=components.empty() ? "No car meshes" : "Car history repair enabled";
    }
    active.store(!components.empty(),std::memory_order_release);
    if (ticks%600==0) SPDLOG_INFO("[AFW primitive history] matched={} applied={} changed={} fallback={}",
        matched.load(),applied.load(),changed.load(),fallback.load());
}
inline void draw() {
    bool value=requested.load();
    if (ImGui::Checkbox("ACR car transform history repair",&value)) { requested=value; deactivate(); }
    std::lock_guard lock(mutex);
    ImGui::TextWrapped("%s%s",status.c_str(),active.load() ? "" : " (inactive)");
    ImGui::Text("Car history: %llu matched / %llu applied / %llu changed",
        (unsigned long long)matched.load(),(unsigned long long)applied.load(),(unsigned long long)changed.load());
}
}
