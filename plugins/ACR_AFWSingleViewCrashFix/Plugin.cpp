#include <atomic>
#include <memory>
#include <windows.h>
#include <safetyhook.hpp>
#include "uevr/Plugin.hpp"
#include "Guard.hpp"

namespace {
acr_single_view::Lookup lookup_partner{};
std::uintptr_t false_epilogue{};
std::atomic<bool> reported{false};

void missing_partner(safetyhook::Context& context) {
    if (!acr_single_view::guard_paired_return(context, lookup_partner, false_epilogue)) return;
    if (!reported.exchange(true)) {
        uevr::API::get()->log_info(
            "[ACR SingleViewCrashFix] Missing secondary view: native paired-view predicate now returns false consistently for every consumer.");
    }
}

class Compatibility final : public uevr::Plugin {
    safetyhook::MidHook paired_guard{};

    void on_initialize() override {
        auto& api = uevr::API::get();
        const auto base = reinterpret_cast<unsigned char*>(GetModuleHandleW(L"acr.exe"));
        if (!base) {
            api->log_info("[ACR SingleViewCrashFix] Not ACR; inactive.");
            return;
        }
        const auto dos = reinterpret_cast<const IMAGE_DOS_HEADER*>(base);
        if (dos->e_magic != IMAGE_DOS_SIGNATURE) return;
        const auto nt = reinterpret_cast<const IMAGE_NT_HEADERS64*>(base + dos->e_lfanew);
        if (nt->Signature != IMAGE_NT_SIGNATURE ||
            nt->FileHeader.Machine != IMAGE_FILE_MACHINE_AMD64 ||
            nt->FileHeader.TimeDateStamp != 0x050dbf19 ||
            nt->OptionalHeader.SizeOfImage != 0xc143000) {
            api->log_error("[ACR SingleViewCrashFix] Unsupported ACR build; no patch installed.");
            return;
        }
        for (const auto& signature : acr_single_view::signatures) {
            if (!acr_single_view::matches(base + signature.rva, signature.hex)) {
                api->log_error(
                    "[ACR SingleViewCrashFix] Code mismatch at RVA %llx; remove the old MonoCompatibility DLL or use the supported ACR build. No patch installed.",
                    static_cast<unsigned long long>(signature.rva));
                return;
            }
        }
        lookup_partner = reinterpret_cast<acr_single_view::Lookup>(base + acr_single_view::lookup_rva);
        false_epilogue = reinterpret_cast<std::uintptr_t>(base) + acr_single_view::unpaired_rva;
        auto result = safetyhook::MidHook::create(base + acr_single_view::hook_rva, missing_partner,
            safetyhook::MidHook::StartDisabled);
        if (!result) {
            api->log_error("[ACR SingleViewCrashFix] Paired-view return hook failed; no patch installed.");
            return;
        }
        if (acr_single_view::hook_rva + result->original_bytes().size() > acr_single_view::unpaired_rva) {
            result->reset();
            api->log_error("[ACR SingleViewCrashFix] Hook would overlap the false-return path; removed without activation.");
            return;
        }
        paired_guard = std::move(*result);
        if (!paired_guard.enable()) {
            paired_guard.reset();
            api->log_error("[ACR SingleViewCrashFix] Paired-view return hook activation failed; no patch installed.");
            return;
        }
        api->log_info(
            "[ACR SingleViewCrashFix] v0.4 installed: consistent paired-view classification for all consumers; one native true-return hook. View flags, matrices and AFW history are unchanged.");
    }
};
std::unique_ptr<Compatibility> instance = std::make_unique<Compatibility>();
}
