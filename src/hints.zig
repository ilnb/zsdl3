// SDL3 Hints Bindings
// Runtime configuration

// Priority enum
pub const Priority = enum(c_int) {
    DEFAULT,
    NORMAL,
    OVERRIDE,
};

pub const Callback = ?*const fn (?*anyopaque, [*:0]const u8, [*:0]const u8, [*:0]const u8) callconv(.c) void;

// Hints functions
extern fn SDL_SetHint(name: [*:0]const u8, value: [*:0]const u8) bool;
extern fn SDL_GetHint(name: [*:0]const u8) ?[*:0]const u8;
extern fn SDL_SetHintWithPriority(name: [*:0]const u8, value: [*:0]const u8, priority: Priority) bool;
extern fn SDL_ResetHint(name: [*:0]const u8) bool;
extern fn SDL_ResetHints() void;
extern fn SDL_AddHintCallback(name: [*:0]const u8, callback: Callback, userdata: ?*anyopaque) bool;
extern fn SDL_RemoveHintCallback(name: [*:0]const u8, callback: Callback, userdata: ?*anyopaque) void;
extern fn SDL_GetHintBoolean(name: [*:0]const u8, default_value: bool) bool;

// Public API
pub const set = SDL_SetHint;
pub const get = SDL_GetHint;
pub const setWithPriority = SDL_SetHintWithPriority;
pub const resetHint = SDL_ResetHint;
pub const resetHints = SDL_ResetHints;
pub const addCallback = SDL_AddHintCallback;
pub const removeCallback = SDL_RemoveHintCallback;
pub const getHintBoolean = SDL_GetHintBoolean;
