#pragma once
#include "ACRSingleViewGuard.hpp"

namespace acr_single_view {
struct CallerSite {
    std::uintptr_t hook, signature_start, paired, single;
    std::uintptr_t safetyhook::Context::*view;
    std::string_view register_name, signature;
};
// Exact native renderer callers with unchecked secondary-view uses. The
// predicate itself and callers outside this table keep their native behavior.
inline constexpr CallerSite caller_sites[] = {
    {0x2cf000f, 0x2cf0007, 0x2cf0017, 0x2cf00bb, &safetyhook::Context::rbx, "rbx", "488bcbe841a5650184c00f84a4000000488bcbe8c1536501"},
    {0x25beeed, 0x25beee8, 0x25beef1, 0x25bef12, &safetyhook::Context::rbp, "rbp", "e863b6d80184c07421488bcde8e764d801"},
    {0x25dc753, 0x25dc74e, 0x25dc757, 0x25dc778, &safetyhook::Context::rdi, "rdi", "e8fdddd60184c07421488bcfe8818cd601"},
    {0x2632fa7, 0x2632fa2, 0x2632fb6, 0x2633229, &safetyhook::Context::rdi, "rdi", "e8a975d101488d4de04c8bc784c00f8473020000389f061200000f84"},
    {0x29f59b2, 0x29f59ad, 0x29f59c0, 0x29f59b6, &safetyhook::Context::r12, "r12", "e89e4b950184c0750a418b8424e00d0000"},
    {0x29f6052, 0x29f604d, 0x29f6060, 0x29f6056, &safetyhook::Context::r12, "r12", "e8fe44950184c0750a418b8424e00d0000"},
    {0x29f656b, 0x29f6566, 0x29f6578, 0x29f656f, &safetyhook::Context::r14, "r14", "e8e53f950184c07509418b86e00d0000eb"},
    {0x29f6dc2, 0x29f6dbd, 0x29f6dcf, 0x29f6dc6, &safetyhook::Context::r13, "r13", "e88e37950184c07509418b85e00d0000eb"},
    {0x2cb3818, 0x2cb3813, 0x2cb3820, 0x2cb3ca7, &safetyhook::Context::r14, "r14", "e8386d690184c00f8487040000448bad6003000041"},
    {0x2cee6c6, 0x2cee6c1, 0x2cee6ce, 0x2ceead1, &safetyhook::Context::r13, "r13", "e88abe650184c00f84030400004180bd0612000000"},
};
using Lookup = void* (*)(void*);
inline bool guard_native_caller(safetyhook::Context& context, const CallerSite& site, Lookup lookup) {
    if ((context.rax & 0xff) == 0) return false;
    if (lookup(reinterpret_cast<void*>(context.*(site.view))) != nullptr) return false;
    context.rax &= ~std::uintptr_t{0xff};
    return true;
}
}
