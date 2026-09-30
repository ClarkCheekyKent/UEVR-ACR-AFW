#include "ACRSingleViewFix.hpp"
#include "ACRSingleViewGuard.hpp"
#include "ACRSingleViewCallerSites.hpp"

#include <array>
#include <atomic>
#include <mutex>
#include <windows.h>
#include <safetyhook.hpp>
#include <spdlog/spdlog.h>

namespace acr_single_view_fix {
namespace {
acr_single_view::Lookup lookup_partner{};
std::array<safetyhook::MidHook, std::size(acr_single_view::caller_sites)> crash_guards{};
std::once_flag installation{};
std::atomic_bool active{false};
std::array<std::atomic_bool, std::size(acr_single_view::caller_sites)> reported{};

template <std::size_t Index>
void missing_partner(safetyhook::Context& context) {
    const auto& site = acr_single_view::caller_sites[Index];
    if (!acr_single_view::guard_native_caller(context, site, lookup_partner)) return;
    if (!reported[Index].exchange(true)) {
        spdlog::info("[ACR SingleViewFix] Missing secondary view at native caller +{:x}; taking its existing single-view branch.", site.hook);
    }
}

constexpr std::array callbacks{missing_partner<0>, missing_partner<1>, missing_partner<2>,
    missing_partner<3>, missing_partner<4>, missing_partner<5>, missing_partner<6>,
    missing_partner<7>, missing_partner<8>, missing_partner<9>};

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

    for (const auto& site : acr_single_view::caller_sites) {
        const auto size = site.signature.size() / 2;
        if (site.signature_start >= nt->OptionalHeader.SizeOfImage ||
            size > nt->OptionalHeader.SizeOfImage - site.signature_start ||
            !acr_single_view::matches(base + site.signature_start, site.signature)) {
            spdlog::error("[ACR SingleViewFix] Native caller signature mismatch at +{:x}; no hook installed.", site.signature_start);
            return;
        }
    }

    lookup_partner = reinterpret_cast<acr_single_view::Lookup>(base + acr_single_view::lookup_rva);
    for (std::size_t i = 0; i < crash_guards.size(); ++i) {
        auto result = safetyhook::MidHook::create(base + acr_single_view::caller_sites[i].hook, callbacks[i]);
        if (!result) {
            for (auto& hook : crash_guards) hook.reset();
            spdlog::error("[ACR SingleViewFix] Native caller hook failed; rolled back all hooks.");
            return;
        }
        crash_guards[i] = std::move(*result);
    }
    active.store(true);
    spdlog::info("[ACR SingleViewFix] Built-in v0.3 installed: 10 native caller checks. Global stereo predicates and AFW view data remain original.");
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
