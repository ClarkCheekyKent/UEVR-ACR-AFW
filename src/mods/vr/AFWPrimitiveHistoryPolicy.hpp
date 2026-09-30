#pragma once
#include <array>
#include <cmath>
#include <cstdint>

namespace afw_primitive_history {
using Matrix = std::array<double, 16>;
inline bool finite(const Matrix& m) {
    for (auto v : m) if (!std::isfinite(v)) return false;
    return true;
}
// Store engine outputs, never our substituted outputs. Multiple consumers in a
// frame must receive the same answer without advancing history multiple times.
struct History {
    uint64_t frame{};
    Matrix current{}, previous{}, corrected{};
    bool valid{}, available{};

    bool update(uint64_t n, const Matrix& now, const Matrix& engine_previous, Matrix& out) {
        out = engine_previous;
        if (!finite(now) || !finite(engine_previous)) { *this = {}; return false; }
        if (valid && n == frame && now == current && engine_previous == previous) {
            if (available) out = corrected;
            return available;
        }
        double distance2{};
        for (int i = 12; i < 15; ++i) distance2 += (now[i]-engine_previous[i])*(now[i]-engine_previous[i]);
        // Equality verifies continuity, including rotation, rather than assuming
        // a counter increment necessarily means the same transform sequence.
        const bool continuous = valid && frame != UINT64_MAX && n == frame+1 &&
            engine_previous == current && distance2 < 1000.0*1000.0;
        const auto older = previous;
        frame = n; current = now; previous = engine_previous; valid = true;
        available = continuous;
        if (available) out = corrected = older;
        return available;
    }
};
}
