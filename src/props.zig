// SDL3 Properties Bindings
// Key-value storage

// Properties ID
pub const ID = u32;

// Property types
pub const Type = enum(c_int) {
    INVALID,
    POINTER,
    STRING,
    NUMBER,
    FLOAT,
    BOOLEAN,
};

pub const CleanupCallback = ?*const fn (?*anyopaque, ?*anyopaque) callconv(.c) void;
pub const EnumerateCallback = ?*const fn (?*anyopaque, ID, [*:0]const u8) callconv(.c) void;

// Properties functions
extern fn SDL_CreateProperties() ID;
extern fn SDL_DestroyProperties(props: ID) void;
extern fn SDL_SetPointerProperty(props: ID, name: [*:0]const u8, value: ?*anyopaque) bool;
extern fn SDL_SetPointerPropertyWithCleanup(props: ID, name: [*:0]const u8, value: ?*anyopaque, cleanup: CleanupCallback, userdata: ?*anyopaque) bool;
extern fn SDL_SetStringProperty(props: ID, name: [*:0]const u8, value: ?[*:0]const u8) bool;
extern fn SDL_SetNumberProperty(props: ID, name: [*:0]const u8, value: i64) bool;
extern fn SDL_SetFloatProperty(props: ID, name: [*:0]const u8, value: f32) bool;
extern fn SDL_SetBooleanProperty(props: ID, name: [*:0]const u8, value: bool) bool;
extern fn SDL_GetPointerProperty(props: ID, name: [*:0]const u8, default_value: ?*anyopaque) ?*anyopaque;
extern fn SDL_GetStringProperty(props: ID, name: [*:0]const u8, default_value: ?[*:0]const u8) ?[*:0]const u8;
extern fn SDL_GetNumberProperty(props: ID, name: [*:0]const u8, default_value: i64) i64;
extern fn SDL_GetFloatProperty(props: ID, name: [*:0]const u8, default_value: f32) f32;
extern fn SDL_GetBooleanProperty(props: ID, name: [*:0]const u8, default_value: bool) bool;
extern fn SDL_GetPropertyType(props: ID, name: [*:0]const u8) Type;
extern fn SDL_ClearProperty(props: ID, name: [*:0]const u8) bool;
extern fn SDL_EnumerateProperties(props: ID, callback: EnumerateCallback, userdata: ?*anyopaque) bool;
extern fn SDL_LockProperties(props: ID) bool;
extern fn SDL_UnlockProperties(props: ID) void;
extern fn SDL_HasProperty(props: ID, name: [*:0]const u8) bool;
extern fn SDL_CopyProperties(src: ID, dst: ID) bool;
extern fn SDL_GetGlobalProperties() ID;

// Public API
pub const create = SDL_CreateProperties;
pub const destroy = SDL_DestroyProperties;
pub const setPointerProp = SDL_SetPointerProperty;
pub const setPointerPropWithCleanup = SDL_SetPointerPropertyWithCleanup;
pub const setStringProp = SDL_SetStringProperty;
pub const setNumberProp = SDL_SetNumberProperty;
pub const setFloatProp = SDL_SetFloatProperty;
pub const setBooleanProp = SDL_SetBooleanProperty;
pub const getPointerProp = SDL_GetPointerProperty;
pub const getStringProp = SDL_GetStringProperty;
pub const getNumberProp = SDL_GetNumberProperty;
pub const getFloatProp = SDL_GetFloatProperty;
pub const getBooleanProp = SDL_GetBooleanProperty;
pub const getPropType = SDL_GetPropertyType;
pub const clearProp = SDL_ClearProperty;
pub const enumerateProps = SDL_EnumerateProperties;
pub const lockProps = SDL_LockProperties;
pub const unlockProps = SDL_UnlockProperties;
pub const hasProp = SDL_HasProperty;
pub const copyProps = SDL_CopyProperties;
pub const getGlobalProps = SDL_GetGlobalProperties;
