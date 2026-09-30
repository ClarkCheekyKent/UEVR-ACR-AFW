#include <windows.h>
#include <dxcapi.h>
#include <wrl/client.h>
#include <fstream>
#include <iostream>
#include <stdexcept>
#include <string>
using Microsoft::WRL::ComPtr;
void check(HRESULT hr){if(FAILED(hr))throw std::runtime_error("HRESULT "+std::to_string((unsigned)hr));}
ComPtr<IDxcBlob> result(IDxcOperationResult* r){HRESULT hr;check(r->GetStatus(&hr));if(FAILED(hr)){ComPtr<IDxcBlobEncoding> e;r->GetErrorBuffer(&e);if(e)std::cerr<<(char*)e->GetBufferPointer();check(hr);}ComPtr<IDxcBlob>b;check(r->GetResult(&b));return b;}
int wmain(int argc,wchar_t** argv)try{
 if(argc<3||argc>4)return 2;
 auto dll=LoadLibraryW(argc==4?argv[3]:L"dxcompiler.dll");
 if(!dll)throw std::runtime_error("Load dxcompiler");auto create=(DxcCreateInstanceProc)GetProcAddress(dll,"DxcCreateInstance");
 ComPtr<IDxcLibrary> lib;check(create(CLSID_DxcLibrary,IID_PPV_ARGS(&lib)));ComPtr<IDxcBlobEncoding> input;UINT cp=CP_UTF8;check(lib->CreateBlobFromFile(argv[1],&cp,&input));
 ComPtr<IDxcAssembler> a;check(create(CLSID_DxcAssembler,IID_PPV_ARGS(&a)));ComPtr<IDxcOperationResult> assembled;check(a->AssembleToContainer(input.Get(),&assembled));auto binary=result(assembled.Get());
 ComPtr<IDxcValidator> v;check(create(CLSID_DxcValidator,IID_PPV_ARGS(&v)));ComPtr<IDxcOperationResult> valid;check(v->Validate(binary.Get(),DxcValidatorFlags_InPlaceEdit,&valid));auto signed_binary=result(valid.Get());
 std::ofstream f(argv[2],std::ios::binary);f.write((char*)signed_binary->GetBufferPointer(),signed_binary->GetBufferSize());std::cout<<"Validated "<<signed_binary->GetBufferSize()<<" bytes\n";return 0;
}catch(const std::exception& e){std::cerr<<e.what();return 1;}
