#pragma once

#include <cstdint>
#include <string_view>
#include <safetyhook/context.hpp>

namespace acr_single_view {
// Exact native bytes expected at an RVA. Every signature of a build must match
// before any hook is installed.
struct Signature { std::uintptr_t rva; std::string_view hex; };

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
