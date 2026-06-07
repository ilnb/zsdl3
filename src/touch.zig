// SDL3 Touch Bindings
// Touchscreen input

// Touch device
pub const ID = u64;

// Finger ID
pub const FingerID = u64;

// Touch functions
extern fn SDL_GetTouchDevices(count: ?*c_int) ?[*]ID;
extern fn SDL_GetTouchDeviceName(touchID: ID) ?[*:0]const u8;
extern fn SDL_GetTouchDeviceType(touchID: ID) DeviceType;
extern fn SDL_GetTouchFingers(touchID: ID, count: ?*c_int) ?[*]?*Finger;

// Touch device type
pub const DeviceType = enum(c_int) {
    INVALID = -1,
    DIRECT,
    INDIRECT_ABSOLUTE,
    INDIRECT_RELATIVE,
};

// Finger struct
pub const Finger = extern struct {
    id: FingerID,
    x: f32,
    y: f32,
    pressure: f32,
};

// Public API
pub const getTouchDevices = SDL_GetTouchDevices;
pub const getTouchDeviceName = SDL_GetTouchDeviceName;
pub const getTouchDeviceType = SDL_GetTouchDeviceType;
pub const getTouchFingers = SDL_GetTouchFingers;
