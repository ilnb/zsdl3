// SDL3 Pen Bindings
// Stylus/pen input

const core = @import("core.zig");

// Pen handle
pub const Pen = opaque {};

// Pen axis
pub const Axis = enum(c_int) {
    PRESSURE,
    XTILT,
    YTILT,
    DISTANCE,
    ROTATION,
    SLIDER,
    TANGENTIAL_PRESSURE,
    COUNT,
};

// Pen functions
extern fn SDL_GetPens(count: ?*c_int) ?[*]core.PenID;
extern fn SDL_GetPenName(pen: ?*Pen) ?[*:0]const u8;
extern fn SDL_GetPenCapabilities(pen: ?*Pen, capabilities: ?*u32) bool;
extern fn SDL_GetPenStatus(pen: ?*Pen, axes: ?[*]f32) bool;
extern fn SDL_PenConnected(pen: ?*Pen) bool;
extern fn SDL_GetPenFromID(id: core.PenID) ?*Pen;
extern fn SDL_GetPenID(pen: ?*Pen) core.PenID;
extern fn SDL_PenAxisSupported(pen: ?*Pen, axis: Axis) bool;

// Public API
pub const get = SDL_GetPens;
pub const getName = SDL_GetPenName;
pub const getCapabilities = SDL_GetPenCapabilities;
pub const getStatus = SDL_GetPenStatus;
pub const isConnected = SDL_PenConnected;
pub const getFromID = SDL_GetPenFromID;
pub const getID = SDL_GetPenID;
pub const isAxisSupported = SDL_PenAxisSupported;
