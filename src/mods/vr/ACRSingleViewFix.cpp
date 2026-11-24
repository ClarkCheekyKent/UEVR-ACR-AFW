#include "ACRSingleViewFix.hpp"
#include "ACRSingleViewGuard.hpp"
#include "ACRSingleViewCallerSites.hpp"

#include <array>
#include <atomic>
#include <mutex>
#include <utility>
#include <windows.h>
#include <safetyhook.hpp>
#include <spdlog/spdlog.h>

namespace acr_single_view_fix {
namespace {
using acr_single_view::max_caller_sites;

acr_single_view::Lookup lookup_partner{};
const acr_single_view::Build* active_build{};
std::array<safetyhook::MidHook, max_caller_sites> crash_guards{};
std::once_flag installation{};
std::atomic_bool active{false};
std::array<std::atomic_bool, max_caller_sites> reported{};

template <std::size_t Index>
void missing_partner(safetyhook::Context& context) {
    const auto& site = active_build->caller_sites[Index];
    if (!acr_single_view::guard_native_caller(context, site, lookup_partner)) return;
    if (!reported[Index].exchange(true)) {
        spdlog::info("[ACR SingleViewFix] Missing secondary view at native caller +{:x}; taking its existing single-view branch.", site.hook);
    }
}

template <std::size_t... Index>
constexpr auto make_callbacks(std::index_sequence<Index...>) {
    return std::array<void (*)(safetyhook::Context&), sizeof...(Index)>{missing_partner<Index>...};
}
constexpr auto callbacks = make_callbacks(std::make_index_sequence<max_caller_sites>{});

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
    const auto* build = nt->Signature == IMAGE_NT_SIGNATURE && nt->FileHeader.Machine == IMAGE_FILE_MACHINE_AMD64
        ? acr_single_view::find_build(nt->FileHeader.TimeDateStamp, nt->OptionalHeader.SizeOfImage) : nullptr;
    if (build == nullptr) {
        spdlog::warn("[ACR SingleViewFix] Unsupported ACR build (PE timestamp {:08x}, image size {:08x}); no hook installed.",
                     nt->FileHeader.TimeDateStamp, nt->OptionalHeader.SizeOfImage);
        return;
    }
    for (const auto& signature : build->signatures) {
        const auto size = signature.hex.size() / 2;
        if (signature.rva >= nt->OptionalHeader.SizeOfImage ||
            size > nt->OptionalHeader.SizeOfImage - signature.rva ||
            !acr_single_view::matches(base + signature.rva, signature.hex)) {
            spdlog::error("[ACR SingleViewFix] Code mismatch at RVA {:x}; no hook installed.", signature.rva);
            return;
        }
    }

    for (const auto& site : build->caller_sites) {
        const auto size = site.signature.size() / 2;
        if (site.signature_start >= nt->OptionalHeader.SizeOfImage ||
            size > nt->OptionalHeader.SizeOfImage - site.signature_start ||
            !acr_single_view::matches(base + site.signature_start, site.signature)) {
            spdlog::error("[ACR SingleViewFix] Native caller signature mismatch at +{:x}; no hook installed.", site.signature_start);
            return;
        }
    }

    // Publish the build and lookup before any hook can fire on a render thread.
    active_build = build;
    lookup_partner = reinterpret_cast<acr_single_view::Lookup>(base + build->lookup_rva);
    for (std::size_t i = 0; i < build->caller_sites.size(); ++i) {
        auto result = safetyhook::MidHook::create(base + build->caller_sites[i].hook, callbacks[i]);
        if (!result) {
            for (auto& hook : crash_guards) hook.reset();
            spdlog::error("[ACR SingleViewFix] Native caller hook failed; rolled back all hooks.");
            return;
        }
        crash_guards[i] = std::move(*result);
    }
    active.store(true);
    spdlog::info("[ACR SingleViewFix] Built-in guard installed for ACR executable {}: {} native caller checks. Global stereo predicates and AFW view data remain original.", build->name, build->caller_sites.size());
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
