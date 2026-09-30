#pragma once
#include <d3d12.h>
#include <cstdint>

// Game-independent AFW shader corrections. Native Rally hooks live separately.
namespace afw_cockpit {
inline constexpr float cutoff_values[]{0.5f, 1.0f, 2.0f, 5.0f, 10.0f};
bool default_enabled();
int cutoff_index(float metres);
void configure(bool allow_moving_history, bool compensate_camera, float cutoff);
void install_device(ID3D12Device* device);
void install_command(ID3D12GraphicsCommandList* command);
struct Status {
    bool supported_game{}, shaders_ready{};
    int mask_selection{-1}, history_selection{-1}, applied_cutoff{-1};
    unsigned mask_pipelines{}, history_pipelines{};
    uint64_t mask_selections{}, depth_selections{}, color_selections{};
    long error{};
};
Status status();
class EvaluationScope {
public:
    explicit EvaluationScope(ID3D12GraphicsCommandList* command);
    ~EvaluationScope();
    EvaluationScope(const EvaluationScope&) = delete;
    EvaluationScope& operator=(const EvaluationScope&) = delete;
private:
    ID3D12GraphicsCommandList* previous_list{};
    bool previous_mask{}, previous_history{};
    int previous_mask_selection{}, previous_history_selection{}, previous_range{};
};
}
