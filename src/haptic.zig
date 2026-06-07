// SDL3 Haptic Bindings
// Force feedback

const input = @import("input.zig");

pub const ID = u32;

// Haptic structs
pub const Haptic = opaque {};

// Haptic effect types
pub const Effect = extern union {
    type: u16,
    constant: Constant,
    periodic: Periodic,
    condition: Condition,
    ramp: Ramp,
    custom: Custom,
};

// Haptic effect subtypes
pub const Constant = extern struct {
    type: u16,
    direction: Direction,
    length: u32,
    delay: u16,
    button: u16,
    interval: u16,
    level: i16,
    attack_length: u16,
    attack_level: u16,
    fade_length: u16,
    fade_level: u16,
};

pub const Periodic = extern struct {
    type: u16,
    direction: Direction,
    length: u32,
    delay: u16,
    button: u16,
    interval: u16,
    period: u16,
    magnitude: i16,
    offset: i16,
    phase: u16,
    attack_length: u16,
    attack_level: u16,
    fade_length: u16,
    fade_level: u16,
};

pub const Condition = extern struct {
    type: u16,
    direction: Direction,
    length: u32,
    delay: u16,
    button: u16,
    interval: u16,
    right_sat: [3]u16,
    left_sat: [3]u16,
    right_coeff: [3]i16,
    left_coeff: [3]i16,
    deadband: [3]u16,
    center: [3]i16,
};

pub const Ramp = extern struct {
    type: u16,
    direction: Direction,
    length: u32,
    delay: u16,
    button: u16,
    interval: u16,
    start: i16,
    end: i16,
    attack_length: u16,
    attack_level: u16,
    fade_length: u16,
    fade_level: u16,
};

pub const Custom = extern struct {
    type: u16,
    direction: Direction,
    length: u32,
    delay: u16,
    button: u16,
    interval: u16,
    channels: u8,
    period: u16,
    samples: u16,
    data: ?[*]i16,
    attack_length: u16,
    attack_level: u16,
    fade_length: u16,
    fade_level: u16,
};

pub const Direction = extern struct {
    type: u8,
    dir: [3]i32,
};

// Haptic functions
extern fn GetHaptics(count: ?*c_int) ?[*]ID;
extern fn GetHapticName(haptic: ?*Haptic) ?[*:0]const u8;
extern fn GetHapticNameForID(instance_id: ID) ?[*:0]const u8;
extern fn OpenHaptic(instance_id: ID) ?*Haptic;
extern fn GetHapticFromID(instance_id: ID) ?*Haptic;
extern fn GetHapticID(haptic: ?*Haptic) ID;
extern fn IsMouseHaptic() bool;
extern fn OpenHapticFromMouse() ?*Haptic;
extern fn IsJoystickHaptic(joystick: ?*input.Joystick) bool;
extern fn OpenHapticFromJoystick(joystick: ?*input.Joystick) ?*Haptic;
extern fn CloseHaptic(haptic: ?*Haptic) void;
extern fn GetMaxHapticEffects(haptic: ?*Haptic) c_int;
extern fn GetMaxHapticEffectsPlaying(haptic: ?*Haptic) c_int;
extern fn GetHapticFeatures(haptic: ?*Haptic) c_uint;
extern fn GetNumHapticAxes(haptic: ?*Haptic) c_int;
extern fn HapticEffectSupported(haptic: ?*Haptic, effect: ?*Effect) bool;
extern fn CreateHapticEffect(haptic: ?*Haptic, effect: ?*const Effect) c_int;
extern fn UpdateHapticEffect(haptic: ?*Haptic, effect: c_int, data: ?*const Effect) bool;
extern fn RunHapticEffect(haptic: ?*Haptic, effect: c_int, iterations: u32) bool;
extern fn StopHapticEffect(haptic: ?*Haptic, effect: c_int) bool;
extern fn DestroyHapticEffect(haptic: ?*Haptic, effect: c_int) void;
extern fn GetHapticEffectStatus(haptic: ?*Haptic, effect: c_int) bool;
extern fn SetHapticGain(haptic: ?*Haptic, gain: c_int) bool;
extern fn SetHapticAutocenter(haptic: ?*Haptic, autocenter: c_int) bool;
extern fn PauseHaptic(haptic: ?*Haptic) bool;
extern fn ResumeHaptic(haptic: ?*Haptic) bool;
extern fn StopHapticEffects(haptic: ?*Haptic) bool;
extern fn HapticRumbleSupported(haptic: ?*Haptic) bool;
extern fn InitHapticRumble(haptic: ?*Haptic) bool;
extern fn PlayHapticRumble(haptic: ?*Haptic, strength: f32, length: u32) bool;
extern fn StopHapticRumble(haptic: ?*Haptic) bool;

// Public API
pub const get = GetHaptics;
pub const getName = GetHapticName;
pub const getNameForID = GetHapticNameForID;
pub const open = OpenHaptic;
pub const getFromID = GetHapticFromID;
pub const getID = GetHapticID;
pub const isMouseHaptic = IsMouseHaptic;
pub const openFromMouse = OpenHapticFromMouse;
pub const isJoystickHaptic = IsJoystickHaptic;
pub const openFromJoystick = OpenHapticFromJoystick;
pub const close = CloseHaptic;
pub const getMaxEffects = GetMaxHapticEffects;
pub const getMaxEffectsPlaying = GetMaxHapticEffectsPlaying;
pub const getFeatures = GetHapticFeatures;
pub const getNumAxes = GetNumHapticAxes;
pub const isEffectSupported = HapticEffectSupported;
pub const createEffect = CreateHapticEffect;
pub const updateEffect = UpdateHapticEffect;
pub const runEffect = RunHapticEffect;
pub const stopEffect = StopHapticEffect;
pub const destroyEffect = DestroyHapticEffect;
pub const getEffectStatus = GetHapticEffectStatus;
pub const setGain = SetHapticGain;
pub const setAutocenter = SetHapticAutocenter;
pub const pause = PauseHaptic;
pub const resumeHaptic = ResumeHaptic;
pub const stopEffects = StopHapticEffects;
pub const isRumbleSupported = HapticRumbleSupported;
pub const initRumble = InitHapticRumble;
pub const playRumble = PlayHapticRumble;
pub const stopRumble = StopHapticRumble;
