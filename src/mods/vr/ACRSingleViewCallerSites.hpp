#pragma once
#include "ACRSingleViewGuard.hpp"

#include <span>

namespace acr_single_view {
struct CallerSite {
    std::uintptr_t hook, signature_start, paired, single;
    std::uintptr_t safetyhook::Context::*view;
    std::string_view register_name, signature;
};

// One audited ACR executable. The native code is identified by PE timestamp and
// image size, then confirmed byte-for-byte through the signatures below.
struct Build {
    std::string_view name;
    std::uint32_t timestamp, image_size;
    std::uintptr_t lookup_rva; // secondary-view lookup; returns null when there is no partner view
    std::span<const Signature> signatures;
    std::span<const CallerSite> caller_sites;
};

// Exact native renderer callers with unchecked secondary-view uses. The
// predicate itself and callers outside these tables keep their native behavior.
// The tables are not exhaustive: see the notes on each build.

// Build used for the original v0.3 audit.
namespace build_050dbf19 {
inline constexpr Signature signatures[] = {
    {0x2cf0007,
     "488bcbe841a5650184c00f84a4000000488bcbe8c15365014c8bf08b45283b452c7512b9040400004c8d452c488d5510e8744968ff8d4801894d28488d5510488b4d204885c9480f45d14863c8418b864c29000089048a488bcbe86a4065014c8bf041bd010000004885c074428b452841bd020000003b452c7512b9040400004c8d452c488d5510e81c4968ff8d4801894d28488d5510488b4d204885c9480f45d14863c8418b864c29000089048a4533f6eb03458bee"},
    {0x434a550, "40534883ec2080b90512000000488bd9741de8b9b0150084c07414488bcbe8cdaa150084c07408b0014883c4205bc332c04883c4205bc3"},
    {0x43453e0, "4883ec2880b90912000000745083b9d00d0000007447488b41084885c0743e486391d80d00008d4a0185c978303b48107d2b488b400848895c2420488b5cd008488bcbe828fc150033c984c0480f45cb488b5c2420488bc14883c428c333c04883c428c3"},
    {0x44a5040, "83b9d00d0000010f96c0c3"},
    {0x44a5050, "83b9d00d0000020f94c0c3"},
    {0x44a5620, "83b9d00d0000000f95c0c3"},
};
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
}

// Assetto Corsa Rally 0.7. The predicate, the lookup and the first ten callers
// are the equivalent native code of the build above at new addresses (same
// order); the first caller was recompiled slightly differently. The last two
// callers have the same unchecked pattern (the eleventh is the third arm of the
// dispatch containing the four before it). The earlier executable contains the
// same two callers (predicate calls at +29f8c5e and +29ffe2f); its table is kept
// as audited for v0.3 and does not guard them.
//
// Known uncovered in this build: two functions inline the predicate instead of
// calling it and use the lookup result unchecked (lookup calls at +2d58376 and
// +2d43622). They need a different hook and have not been seen to crash.
namespace build_6e94fbf7 {
inline constexpr Signature signatures[] = {
    {0x2c873d7,
     "488bcbe8115c660184c00f84a6000000488bcbe8910a66014c8bf08b45283b452c7512b9040400004c8d452c488d5510e8f4eb68ff8d4801894d28488d5510488b4d204885c9480f45d14863c8418b865c29000089048a488bcbe83af76501c74584010000004c8bf04885c074438b4528c74584020000003b452c7512b9040400004c8d452c488d5510e89aeb68ff8d4801894d28488d5510488b4d204885c9480f45d14863c8418b865c29000089048a4533f6"},
    {0x42ecff0, "40534883ec2080b90512000000488bd9741de8e9b6150084c07414488bcbe8fdb0150084c07408b0014883c4205bc332c04883c4205bc3"},
    {0x42e7e80, "4883ec2880b90912000000745083b9d00d0000007447488b41084885c0743e486391d80d00008d4a0185c978303b48107d2b488b400848895c2420488b5cd008488bcbe85802160033c984c0480f45cb488b5c2420488bc14883c428c333c04883c428c3"},
    {0x4448110, "83b9d00d0000010f96c0c3"},
    {0x4448120, "83b9d00d0000020f94c0c3"},
    {0x44486f0, "83b9d00d0000000f95c0c3"},
};
inline constexpr CallerSite caller_sites[] = {
    {0x2c873df, 0x2c873d7, 0x2c873e7, 0x2c8748d, &safetyhook::Context::rbx, "rbx", "488bcbe8115c660184c00f84a6000000488bcbe8910a6601"},
    {0x256053d, 0x2560538, 0x2560541, 0x2560562, &safetyhook::Context::rbp, "rbp", "e8b3cad80184c07421488bcde83779d801"},
    {0x257dda3, 0x257dd9e, 0x257dda7, 0x257ddc8, &safetyhook::Context::rdi, "rdi", "e84df2d60184c07421488bcfe8d1a0d601"},
    {0x25d91b7, 0x25d91b2, 0x25d91c6, 0x25d9439, &safetyhook::Context::rdi, "rdi", "e8393ed101488d4de04c8bc784c00f8473020000389f061200000f84"},
    {0x29cef72, 0x29cef6d, 0x29cef80, 0x29cef76, &safetyhook::Context::r12, "r12", "e87ee0910184c0750a418b8424e00d0000"},
    {0x29cf612, 0x29cf60d, 0x29cf620, 0x29cf616, &safetyhook::Context::r12, "r12", "e8ded9910184c0750a418b8424e00d0000"},
    {0x29cfb2b, 0x29cfb26, 0x29cfb38, 0x29cfb2f, &safetyhook::Context::r14, "r14", "e8c5d4910184c07509418b86e00d0000eb"},
    {0x29d0382, 0x29d037d, 0x29d038f, 0x29d0386, &safetyhook::Context::r13, "r13", "e86ecc910184c07509418b85e00d0000eb"},
    {0x2c6d698, 0x2c6d693, 0x2c6d6a0, 0x2c6db27, &safetyhook::Context::r14, "r14", "e858f9670184c00f8487040000448bad6003000041"},
    {0x2c85a56, 0x2c85a51, 0x2c85a5e, 0x2c85e61, &safetyhook::Context::r13, "r13", "e89a75660184c00f84030400004180bd0612000000"},
    {0x29d2233, 0x29d222e, 0x29d2240, 0x29d2237, &safetyhook::Context::r14, "r14", "e8bdad910184c07509418b86e00d0000eb"},
    {0x29d7074, 0x29d706f, 0x29d7082, 0x29d711d, &safetyhook::Context::rbx, "rbx", "e87c5f9101440fb6f84183ff010f859b000000488bcbe8f60d9101"},
};
}

inline constexpr Build builds[] = {
    {"050dbf19", 0x050dbf19, 0x0c143000, 0x43453e0, build_050dbf19::signatures, build_050dbf19::caller_sites},
    {"6e94fbf7 (0.7)", 0x6e94fbf7, 0x0c21d000, 0x42e7e80, build_6e94fbf7::signatures, build_6e94fbf7::caller_sites},
};
// Upper bound of caller sites over all builds; sizes the hook storage.
inline constexpr std::size_t max_caller_sites = 12;
static_assert([] {
    for (const auto& build : builds)
        if (build.caller_sites.size() > max_caller_sites) return false;
    return true;
}(), "max_caller_sites is smaller than a build's caller site table");

inline constexpr const Build* find_build(std::uint32_t timestamp, std::uint32_t image_size) {
    for (const auto& build : builds)
        if (build.timestamp == timestamp && build.image_size == image_size) return &build;
    return nullptr;
}

using Lookup = void* (*)(void*);
inline bool guard_native_caller(safetyhook::Context& context, const CallerSite& site, Lookup lookup) {
    if ((context.rax & 0xff) == 0) return false;
    if (lookup(reinterpret_cast<void*>(context.*(site.view))) != nullptr) return false;
    context.rax &= ~std::uintptr_t{0xff};
    return true;
}
}
