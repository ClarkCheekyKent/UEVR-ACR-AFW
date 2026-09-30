#include "ACRSingleViewFix.hpp"
#include "ACRSingleViewGuard.hpp"

#include <atomic>
#include <mutex>
#include <windows.h>
#include <safetyhook.hpp>
#include <spdlog/spdlog.h>

namespace acr_single_view_fix {
namespace {
acr_single_view::Lookup lookup_partner{};
std::uintptr_t false_epilogue{};
safetyhook::MidHook paired_guard{};
std::once_flag installation{};
std::atomic_bool active{false};
std::atomic_bool reported{false};

void missing_partner(safetyhook::Context& context) {
    if (!acr_single_view::guard_paired_return(context, lookup_partner, false_epilogue)) return;
    if (!reported.exchange(true)) {
        spdlog::info("[ACR SingleViewFix] Missing secondary view: native paired-view predicate returns false for every consumer.");
    }
}

void install_once() {
    const auto base = reinterpret_cast<unsigned char*>(GetModuleHandleW(L"acr.exe"));
    if (!base || base != reinterpret_cast<unsigned char*>(GetModuleHandleW(nullptr))) return;

    // An externally loaded compatibility plugin keeps ownership of its hook.
    if (GetModuleHandleW(L"ACR_AFWSingleViewCrashFix.dll") || GetModuleHandleW(L"ACR_MonoCompatibility.dll")) {
        spdlog::info("[ACR SingleViewFix] Existing compatibility DLL loaded; leaving the hook to that plugin.");
        return;
    }

    const auto dos = reinterpret_cast<const IMAGE_DOS_HEADER*>(base);
    if (dos->e_magic != IMAGE_DOS_SIGNATURE || dos->e_lfanew <= 0 || dos->e_lfanew > 0x100000) return;
    const auto nt = reinterpret_cast<const IMAGE_NT_HEADERS64*>(base + dos->e_lfanew);
    if (nt->Signature != IMAGE_NT_SIGNATURE ||
        nt->FileHeader.Machine != IMAGE_FILE_MACHINE_AMD64 ||
        nt->FileHeader.TimeDateStamp != 0x050dbf19 ||
        nt->OptionalHeader.SizeOfImage != 0x0c143000) {
        spdlog::warn("[ACR SingleViewFix] Unsupported ACR build; no hook installed.");
        return;
    }
    for (const auto& signature : acr_single_view::signatures) {
        const auto size = signature.hex.size() / 2;
        if (signature.rva >= nt->OptionalHeader.SizeOfImage ||
            size > nt->OptionalHeader.SizeOfImage - signature.rva ||
            !acr_single_view::matches(base + signature.rva, signature.hex)) {
            spdlog::error("[ACR SingleViewFix] Code mismatch at RVA {:x}; no hook installed.", signature.rva);
            return;
        }
    }

    lookup_partner = reinterpret_cast<acr_single_view::Lookup>(base + acr_single_view::lookup_rva);
    false_epilogue = reinterpret_cast<std::uintptr_t>(base) + acr_single_view::unpaired_rva;
    auto result = safetyhook::MidHook::create(base + acr_single_view::hook_rva, missing_partner,
        safetyhook::MidHook::StartDisabled);
    if (!result) {
        spdlog::error("[ACR SingleViewFix] Paired-view return hook failed; no hook installed.");
        return;
    }
    if (acr_single_view::hook_rva + result->original_bytes().size() > acr_single_view::unpaired_rva) {
        result->reset();
        spdlog::error("[ACR SingleViewFix] Hook would overlap the false-return path; removed without activation.");
        return;
    }
    paired_guard = std::move(*result);
    if (!paired_guard.enable()) {
        paired_guard.reset();
        spdlog::error("[ACR SingleViewFix] Hook activation failed; no hook installed.");
        return;
    }
    active.store(true);
    spdlog::info("[ACR SingleViewFix] Built-in v0.4 guard installed: one native paired-view return hook.");
}
}

bool install() {
    std::call_once(installation, install_once);
    return installed();
}

bool installed() {
    return active.load();
}
}
