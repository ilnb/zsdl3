// SDL3 Power Bindings
// Battery and power status

// Power state
pub const PowerState = enum(c_int) {
    ERROR = -1,
    UNKNOWN,
    ON_BATTERY,
    NO_BATTERY,
    CHARGING,
    CHARGED,
};

// Power functions
extern fn SDL_GetPowerInfo(seconds: ?*c_int, percent: ?*c_int) PowerState;

// Public API
pub const getPowerInfo = SDL_GetPowerInfo;
