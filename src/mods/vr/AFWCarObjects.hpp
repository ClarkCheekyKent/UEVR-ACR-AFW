#pragma once
#include <sdk/UObjectArray.hpp>
#include <sdk/UFunction.hpp>
#include <sdk/FProperty.hpp>
#include <sdk/APlayerController.hpp>
#include <sdk/UGameplayStatics.hpp>
#include <sdk/UEngine.hpp>
#include <utility/String.hpp>
#include <string>
#include <string_view>
// Only the identity/reflection helpers needed by the preserved history repair.
// No foreground diagnostics, material mutation or capture code is imported.
namespace afw_car_objects {
inline bool fits(int offset, size_t bytes, int extent) {
    return offset >= 0 && extent > 0 && extent <= 1024*1024 &&
        size_t(offset) <= size_t(extent) && bytes <= size_t(extent)-size_t(offset);
}
struct Handle {
    sdk::UObject* ptr{};
    int index{-1}, serial{};
    sdk::UClass* cls{};
};
inline sdk::UObject* resolve(const Handle& h) {
    if (!h.ptr) return nullptr;
    auto* a = sdk::FUObjectArray::get();
    if (!a || h.index < 0 || h.index >= a->get_object_count()) return nullptr;
    auto* item = a->get_object(h.index);
    if (!item || item->object != h.ptr || item->serial_number != h.serial) return nullptr;
    if (h.ptr->is_pending_kill_or_unreachable() || h.ptr->get_class() != h.cls) return nullptr;
    return h.ptr;
}
inline Handle handle(sdk::UObject* p) {
    auto* a = sdk::FUObjectArray::get();
    if (!p || !a) return {};
    const auto i = p->get_internal_index();
    if (i >= uint32_t(a->get_object_count())) return {};
    auto* item = a->get_object(int(i));
    if (!item || item->object != p || p->is_pending_kill_or_unreachable()) return {};
    return {p, int(i), item->serial_number, p->get_class()};
}
inline std::string type(sdk::FProperty* p) {
    return p && p->get_class() ? utility::narrow(p->get_class()->get_name().to_string()) : "";
}

inline bool has_class(sdk::UObject* p, std::wstring_view wanted) {
    int count{};
    for (auto* c = p ? p->get_class() : nullptr; c && count++ < 64; c = (sdk::UClass*)c->get_super_struct())
        if (c->get_fname().to_string() == wanted) return true;
    return false;
}

inline sdk::UObject* object_field(sdk::UObject* obj, const wchar_t* key) {
    if (!obj) return nullptr;
    auto* p = obj->get_class()->find_property(key);
    if (type(p) != "ObjectProperty" || !fits(p->get_offset(), sizeof(void*), obj->get_class()->get_properties_size())) return nullptr;
    return *p->get_data<sdk::UObject*>(obj);
}

inline bool owned_by(sdk::UObject* object, sdk::UObject* pawn) {
    for (int i = 0; object && i < 16; ++i, object = object->get_outer()) if (object == pawn) return true;
    return false;
}

}
