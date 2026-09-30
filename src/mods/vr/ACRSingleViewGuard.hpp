#pragma once

#include <cstdint>
#include <string_view>
#include <safetyhook/context.hpp>

namespace acr_single_view {
inline constexpr std::uintptr_t hook_rva = 0x2cf000f;
inline constexpr std::uintptr_t unpaired_rva = 0x2cf00bb;
inline constexpr std::uintptr_t predicate_rva = 0x434a550;
inline constexpr std::uintptr_t lookup_rva = 0x43453e0;
inline constexpr std::uintptr_t arena_begin = 0x25b0000;
inline constexpr std::uintptr_t arena_end = 0x44a8000;

struct Signature { std::uintptr_t rva; std::string_view hex; };
inline constexpr Signature signatures[] = {
    {0x2cf0007,
     "488bcbe841a5650184c00f84a4000000488bcbe8c15365014c8bf08b45283b452c7512b9040400004c8d452c488d5510e8744968ff8d4801894d28488d5510488b4d204885c9480f45d14863c8418b864c29000089048a488bcbe86a4065014c8bf041bd010000004885c074428b452841bd020000003b452c7512b9040400004c8d452c488d5510e81c4968ff8d4801894d28488d5510488b4d204885c9480f45d14863c8418b864c29000089048a4533f6eb03458bee"},
    {0x434a550, "40534883ec2080b90512000000488bd9741de8b9b0150084c07414488bcbe8cdaa150084c07408b0014883c4205bc332c04883c4205bc3"},
    {0x43453e0, "4883ec2880b90912000000745083b9d00d0000007447488b41084885c0743e486391d80d00008d4a0185c978303b48107d2b488b400848895c2420488b5cd008488bcbe828fc150033c984c0480f45cb488b5c2420488bc14883c428c333c04883c428c3"},
    {0x44a5040, "83b9d00d0000010f96c0c3"},
    {0x44a5050, "83b9d00d0000020f94c0c3"},
    {0x44a5620, "83b9d00d0000000f95c0c3"},
};
inline unsigned nibble(char value) {
    return value <= '9' ? value - '0' : value - 'a' + 10;
}
inline unsigned char byte_at(std::string_view hex, std::size_t index) {
    return static_cast<unsigned char>((nibble(hex[index * 2]) << 4) | nibble(hex[index * 2 + 1]));
}
inline bool matches(const unsigned char* code, std::string_view hex) {
    for (std::size_t i = 0; i < hex.size() / 2; ++i)
        if (code[i] != byte_at(hex, i)) return false;
    return true;
}
}
