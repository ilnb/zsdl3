// SDL3 Events Bindings
// Complete event handling and polling

const core = @import("core.zig");
const sensor = @import("sensor.zig");
pub const EventType = core.EventType;
const WindowID = core.WindowID;
const DisplayID = core.DisplayID;
const KeyboardID = core.KeyboardID;
const JoystickID = core.JoystickID;
const PenID = core.PenID;
const input = @import("input.zig");
const pen = @import("pen.zig");
const touch = @import("touch.zig");
const power = @import("power.zig");
const camera = @import("camera.zig");
const Finger = touch.Finger;
const FingerID = touch.FingerID;
const video = @import("video.zig");

// Import types
// === Complete SDL3 Event Type Constants ===
// Application events
pub const FIRST = 0;
pub const QUIT = 0x100;
pub const TERMINATING = 0x101;
pub const LOW_MEMORY = 0x102;
pub const WILL_ENTER_BACKGROUND = 0x103;
pub const DID_ENTER_BACKGROUND = 0x104;
pub const WILL_ENTER_FOREGROUND = 0x105;
pub const DID_ENTER_FOREGROUND = 0x106;
pub const LOCALE_CHANGED = 0x107;
pub const SYSTEM_THEME_CHANGED = 0x108;

// Display events
pub const DISPLAY_ORIENTATION = 0x151;
pub const DISPLAY_ADDED = 0x152;
pub const DISPLAY_REMOVED = 0x153;
pub const DISPLAY_MOVED = 0x154;
pub const DISPLAY_DESKTOP_MODE_CHANGED = 0x155;
pub const DISPLAY_CURRENT_MODE_CHANGED = 0x156;
pub const DISPLAY_CONTENT_SCALE_CHANGED = 0x157;
pub const DISPLAY_USABLE_BOUNDS_CHANGED = 0x158;
pub const DISPLAY_FIRST = DISPLAY_ORIENTATION;
pub const DISPLAY_LAST = DISPLAY_USABLE_BOUNDS_CHANGED;

// Window events
pub const WINDOW_SHOWN = 0x202;
pub const WINDOW_HIDDEN = 0x203;
pub const WINDOW_EXPOSED = 0x204;
pub const WINDOW_MOVED = 0x205;
pub const WINDOW_RESIZED = 0x206;
pub const WINDOW_PIXEL_SIZE_CHANGED = 0x207;
pub const WINDOW_METAL_VIEW_RESIZED = 0x208;
pub const WINDOW_MINIMIZED = 0x209;
pub const WINDOW_MAXIMIZED = 0x20A;
pub const WINDOW_RESTORED = 0x20B;
pub const WINDOW_MOUSE_ENTER = 0x20C;
pub const WINDOW_MOUSE_LEAVE = 0x20D;
pub const WINDOW_FOCUS_GAINED = 0x20E;
pub const WINDOW_FOCUS_LOST = 0x20F;
pub const WINDOW_CLOSE_REQUESTED = 0x210;
pub const WINDOW_HIT_TEST = 0x211;
pub const WINDOW_ICCPROF_CHANGED = 0x212;
pub const WINDOW_DISPLAY_CHANGED = 0x213;
pub const WINDOW_DISPLAY_SCALE_CHANGED = 0x214;
pub const WINDOW_SAFE_AREA_CHANGED = 0x215;
pub const WINDOW_OCCLUDED = 0x216;
pub const WINDOW_ENTER_FULLSCREEN = 0x217;
pub const WINDOW_LEAVE_FULLSCREEN = 0x218;
pub const WINDOW_DESTROYED = 0x219;
pub const WINDOW_HDR_STATE_CHANGED = 0x21A;
pub const WINDOW_FIRST = WINDOW_SHOWN;
pub const WINDOW_LAST = WINDOW_HDR_STATE_CHANGED;

// Keyboard events
pub const KEY_DOWN = 0x300;
pub const KEY_UP = 0x301;
pub const TEXT_EDITING = 0x302;
pub const TEXT_INPUT = 0x303;
pub const KEYMAP_CHANGED = 0x304;
pub const KEYBOARD_ADDED = 0x305;
pub const KEYBOARD_REMOVED = 0x306;
pub const TEXT_EDITING_CANDIDATES = 0x307;
pub const SCREEN_KEYBOARD_SHOWN = 0x308;
pub const SCREEN_KEYBOARD_HIDDEN = 0x309;

// Mouse events
pub const MOUSE_MOTION = 0x400;
pub const MOUSE_BUTTON_DOWN = 0x401;
pub const MOUSE_BUTTON_UP = 0x402;
pub const MOUSE_WHEEL = 0x403;
pub const MOUSE_ADDED = 0x404;
pub const MOUSE_REMOVED = 0x405;

// Joystick events
pub const JOYSTICK_AXIS_MOTION = 0x600;
pub const JOYSTICK_BALL_MOTION = 0x601;
pub const JOYSTICK_HAT_MOTION = 0x602;
pub const JOYSTICK_BUTTON_DOWN = 0x603;
pub const JOYSTICK_BUTTON_UP = 0x604;
pub const JOYSTICK_ADDED = 0x605;
pub const JOYSTICK_REMOVED = 0x606;
pub const JOYSTICK_BATTERY_UPDATED = 0x607;
pub const JOYSTICK_UPDATE_COMPLETE = 0x608;

// Gamepad events
pub const GAMEPAD_AXIS_MOTION = 0x650;
pub const GAMEPAD_BUTTON_DOWN = 0x651;
pub const GAMEPAD_BUTTON_UP = 0x652;
pub const GAMEPAD_ADDED = 0x653;
pub const GAMEPAD_REMOVED = 0x654;
pub const GAMEPAD_REMAPPED = 0x655;
pub const GAMEPAD_TOUCHPAD_DOWN = 0x656;
pub const GAMEPAD_TOUCHPAD_MOTION = 0x657;
pub const GAMEPAD_TOUCHPAD_UP = 0x658;
pub const GAMEPAD_SENSOR_UPDATE = 0x659;
pub const GAMEPAD_UPDATE_COMPLETE = 0x65A;
pub const GAMEPAD_STEAM_HANDLE_UPDATED = 0x65B;

// Touch events
pub const FINGER_DOWN = 0x700;
pub const FINGER_UP = 0x701;
pub const FINGER_MOTION = 0x702;
pub const FINGER_CANCELED = 0x703;

// Pinch events
pub const PINCH_BEGIN = 0x710;
pub const PINCH_UPDATE = 0x711;
pub const PINCH_END = 0x712;

// Clipboard events
pub const CLIPBOARD_UPDATE = 0x900;

// Drag and drop events
pub const DROP_FILE = 0x1000;
pub const DROP_TEXT = 0x1001;
pub const DROP_BEGIN = 0x1002;
pub const DROP_COMPLETE = 0x1003;
pub const DROP_POSITION = 0x1004;

// Audio hotplug events
pub const AUDIO_DEVICE_ADDED = 0x1100;
pub const AUDIO_DEVICE_REMOVED = 0x1101;
pub const AUDIO_DEVICE_FORMAT_CHANGED = 0x1102;

// Sensor events
pub const SENSOR_UPDATE = 0x1200;

// Pen events
pub const PEN_PROXIMITY_IN = 0x1300;
pub const PEN_PROXIMITY_OUT = 0x1301;
pub const PEN_DOWN = 0x1302;
pub const PEN_UP = 0x1303;
pub const PEN_BUTTON_DOWN = 0x1304;
pub const PEN_BUTTON_UP = 0x1305;
pub const PEN_MOTION = 0x1306;
pub const PEN_AXIS = 0x1307;

// Camera events
pub const CAMERA_DEVICE_ADDED = 0x1400;
pub const CAMERA_DEVICE_REMOVED = 0x1401;
pub const CAMERA_DEVICE_APPROVED = 0x1402;
pub const CAMERA_DEVICE_DENIED = 0x1403;

// Render events
pub const RENDER_TARGETS_RESET = 0x2000;
pub const RENDER_DEVICE_RESET = 0x2001;
pub const RENDER_DEVICE_LOST = 0x2002;

// Private events
pub const PRIVATE0 = 0x4000;
pub const PRIVATE1 = 0x4001;
pub const PRIVATE2 = 0x4002;
pub const PRIVATE3 = 0x4003;

// Internal events
pub const POLL_SENTINEL = 0x7F00;

// User events
pub const USER = 0x8000;
pub const LAST = 0xFFFF;

// === Event Structures ===
// Note: This union uses padding for ABI compatibility
// Individual event structs are defined in events.zig
// The union must include all event types for proper ABI compatibility
pub const Event = extern union {
    type: EventType,
    common: Common,
    display: extern struct {
        type: EventType,
        reserved: u32,
        timestamp: u64,
        displayID: DisplayID,
        data1: i32,
        data2: i32,
    },
    window: extern struct {
        type: EventType,
        reserved: u32,
        timestamp: u64,
        windowID: WindowID,
        data1: i32,
        data2: i32,
    },
    kdevice: extern struct {
        type: EventType,
        reserved: u32,
        timestamp: u64,
        which: KeyboardID,
    },
    key: Keyboard,
    edit: TextEditing,
    edit_candidates: TextEditingCandidates,
    text: TextInput,
    mdevice: extern struct {
        type: EventType,
        reserved: u32,
        timestamp: u64,
        which: u32, // MouseID
    },
    motion: MouseMotion,
    button: extern struct {
        type: EventType,
        reserved: u32,
        timestamp: u64,
        windowID: WindowID,
        which: u32, // MouseID
        button: u8,
        down: bool,
        clicks: u8,
        padding: u8,
        x: f32,
        y: f32,
    },
    wheel: extern struct {
        type: EventType,
        reserved: u32,
        timestamp: u64,
        windowID: WindowID,
        which: u32, // MouseID
        x: f32,
        y: f32,
        direction: u32, // MouseWheelDirection
        mouse_x: f32,
        mouse_y: f32,
        integer_x: i32,
        integer_y: i32,
    },
    jdevice: extern struct {
        type: EventType,
        reserved: u32,
        timestamp: u64,
        which: JoystickID,
    },
    jaxis: extern struct {
        type: EventType,
        reserved: u32,
        timestamp: u64,
        which: JoystickID,
        axis: u8,
        padding1: u8,
        padding2: u8,
        padding3: u8,
        value: i16,
        padding4: u16,
    },
    jball: extern struct {
        type: EventType,
        reserved: u32,
        timestamp: u64,
        which: JoystickID,
        ball: u8,
        padding1: u8,
        padding2: u8,
        padding3: u8,
        xrel: i16,
        yrel: i16,
    },
    jhat: extern struct {
        type: EventType,
        reserved: u32,
        timestamp: u64,
        which: JoystickID,
        hat: u8,
        value: u8,
        padding1: u8,
        padding2: u8,
    },
    jbutton: extern struct {
        type: EventType,
        reserved: u32,
        timestamp: u64,
        which: JoystickID,
        button: u8,
        down: bool,
        padding1: u8,
        padding2: u8,
    },
    jbattery: extern struct {
        type: EventType,
        reserved: u32,
        timestamp: u64,
        which: JoystickID,
        state: u32, // PowerState
        percent: c_int,
    },
    gdevice: extern struct {
        type: EventType,
        reserved: u32,
        timestamp: u64,
        which: JoystickID,
    },
    gaxis: extern struct {
        type: EventType,
        reserved: u32,
        timestamp: u64,
        which: JoystickID,
        axis: u8,
        padding1: u8,
        padding2: u8,
        padding3: u8,
        value: i16,
        padding4: u16,
    },
    gbutton: extern struct {
        type: EventType,
        reserved: u32,
        timestamp: u64,
        which: JoystickID,
        button: u8,
        down: bool,
        padding1: u8,
        padding2: u8,
    },
    gtouchpad: extern struct {
        type: EventType,
        reserved: u32,
        timestamp: u64,
        which: JoystickID,
        touchpad: i32,
        finger: i32,
        x: f32,
        y: f32,
        pressure: f32,
    },
    gsensor: extern struct {
        type: EventType,
        reserved: u32,
        timestamp: u64,
        which: JoystickID,
        sensor: i32,
        data: [3]f32,
        sensor_timestamp: u64,
    },
    adevice: extern struct {
        type: EventType,
        reserved: u32,
        timestamp: u64,
        which: u32, // AudioDeviceID
        recording: bool,
        padding1: u8,
        padding2: u8,
        padding3: u8,
    },
    cdevice: extern struct {
        type: EventType,
        reserved: u32,
        timestamp: u64,
        which: u32, // CameraID
    },
    sensor: extern struct {
        type: EventType,
        reserved: u32,
        timestamp: u64,
        which: sensor.ID,
        data: [6]f32,
        sensor_timestamp: u64,
    },
    quit: Quit,
    user: extern struct {
        type: u32, // u32 because user events are not in EventType enum
        reserved: u32,
        timestamp: u64,
        windowID: WindowID,
        code: i32,
        data1: ?*anyopaque,
        data2: ?*anyopaque,
    },
    tfinger: extern struct {
        type: EventType,
        reserved: u32,
        timestamp: u64,
        touchID: u64, // TouchID
        fingerID: i64, // FingerID
        x: f32,
        y: f32,
        dx: f32,
        dy: f32,
        pressure: f32,
        windowID: WindowID,
    },
    pinch: extern struct {
        type: EventType,
        reserved: u32,
        timestamp: u64,
        scale: f32,
        windowID: WindowID,
    },
    pproximity: extern struct {
        type: EventType,
        reserved: u32,
        timestamp: u64,
        windowID: WindowID,
        which: PenID,
    },
    ptouch: extern struct {
        type: EventType,
        reserved: u32,
        timestamp: u64,
        windowID: WindowID,
        which: PenID,
        pen_state: u32,
        x: f32,
        y: f32,
        eraser: bool,
        down: bool,
    },
    pmotion: extern struct {
        type: EventType,
        reserved: u32,
        timestamp: u64,
        windowID: WindowID,
        which: PenID,
        pen_state: u32,
        x: f32,
        y: f32,
    },
    pbutton: extern struct {
        type: EventType,
        reserved: u32,
        timestamp: u64,
        windowID: WindowID,
        which: PenID,
        pen_state: u32,
        x: f32,
        y: f32,
        button: u8,
        down: bool,
    },
    paxis: extern struct {
        type: EventType,
        reserved: u32,
        timestamp: u64,
        windowID: WindowID,
        which: PenID,
        pen_state: u32,
        x: f32,
        y: f32,
        axis: u32, // PenAxis
        value: f32,
    },
    render: extern struct {
        type: EventType,
        reserved: u32,
        timestamp: u64,
        windowID: WindowID,
    },
    drop: extern struct {
        type: EventType,
        reserved: u32,
        timestamp: u64,
        windowID: WindowID,
        x: f32,
        y: f32,
        source: [*c]const u8,
        data: [*c]const u8,
    },
    clipboard: extern struct {
        type: EventType,
        reserved: u32,
        timestamp: u64,
        owner: bool,
        padding1: u8,
        padding2: u8,
        padding3: u8,
        num_mime_types: i32,
        mime_types: [*c]const [*c]const u8,
    },
    // padding for ABI - all event types can be accessed via casting
    padding: [128]u8,
};

// Common event data
pub const Common = extern struct {
    type: EventType,
    reserved: u32,
    timestamp: u64,
};

// Quit event
pub const Quit = extern struct {
    type: EventType,
    reserved: u32,
    timestamp: u64,
};

// Keyboard event structure
pub const Keyboard = extern struct {
    type: EventType,
    reserved: u32,
    timestamp: u64,
    windowID: WindowID,
    which: core.KeyboardID,
    scancode: core.Scancode,
    key: core.Keycode,
    mod: core.Keymod,
    raw: u16,
    down: bool,
    repeat: bool,
};

// Mouse motion event structure
pub const MouseMotion = extern struct {
    type: EventType,
    reserved: u32,
    timestamp: u64,
    windowID: WindowID,
    which: u32, // MouseID
    state: u32, // MouseButtonFlags
    x: f32,
    y: f32,
    xrel: f32,
    yrel: f32,
};

// Text input event structures
pub const TextEditing = extern struct {
    type: EventType,
    reserved: u32,
    timestamp: u64,
    windowID: WindowID,
    text: [*c]const u8,
    start: i32,
    length: i32,
};

pub const TextEditingCandidates = extern struct {
    type: EventType,
    reserved: u32,
    timestamp: u64,
    windowID: WindowID,
    candidates: [*c]const [*c]const u8,
    num_candidates: i32,
    selected_candidate: i32,
    horizontal: bool,
    padding1: u8,
    padding2: u8,
    padding3: u8,
};

pub const TextInput = extern struct {
    type: EventType,
    reserved: u32,
    timestamp: u64,
    windowID: WindowID,
    text: [*c]const u8,
};

// Window event structure
pub const Window = extern struct {
    type: EventType,
    reserved: u32,
    timestamp: u64,
    windowID: WindowID,
    data1: i32,
    data2: i32,
};

// Display event structure
pub const Display = extern struct {
    type: EventType,
    reserved: u32,
    timestamp: u64,
    displayID: core.DisplayID,
    data1: i32,
    data2: i32,
};

// Keyboard device event structure
pub const KeyboardDevice = extern struct {
    type: EventType,
    reserved: u32,
    timestamp: u64,
    which: core.KeyboardID,
};

// Text editing event structure (defined in core.zig for union access, re-exported here)
// pub const SDL_TextEditingEvent = ... (see core.zig)

// Text editing candidates event structure (defined in core.zig for union access, re-exported here)
// pub const SDL_TextEditingCandidatesEvent = ... (see core.zig)

// Text input event structure (defined in core.zig for union access, re-exported here)
// pub const SDL_TextInputEvent = ... (see core.zig)

// Mouse device event structure
pub const MouseDevice = extern struct {
    type: EventType,
    reserved: u32,
    timestamp: u64,
    which: input.MouseID,
};

// Mouse button event structure
pub const MouseButton = extern struct {
    type: EventType,
    reserved: u32,
    timestamp: u64,
    windowID: WindowID,
    which: input.MouseID,
    button: u8,
    down: bool,
    clicks: u8,
    padding: u8,
    x: f32,
    y: f32,
};

// Mouse wheel event structure
pub const MouseWheel = extern struct {
    type: EventType,
    reserved: u32,
    timestamp: u64,
    windowID: WindowID,
    which: input.MouseID,
    x: f32,
    y: f32,
    direction: input.MouseWheelDirection,
    mouse_x: f32,
    mouse_y: f32,
    integer_x: i32,
    integer_y: i32,
};

// Joystick device event structure
pub const JoyDevice = extern struct {
    type: EventType,
    reserved: u32,
    timestamp: u64,
    which: core.JoystickID,
};

// Joystick axis event structure
pub const JoyAxis = extern struct {
    type: EventType,
    reserved: u32,
    timestamp: u64,
    which: core.JoystickID,
    axis: u8,
    padding1: u8,
    padding2: u8,
    padding3: u8,
    value: i16,
    padding4: u16,
};

// Joystick ball event structure
pub const JoyBall = extern struct {
    type: EventType,
    reserved: u32,
    timestamp: u64,
    which: core.JoystickID,
    ball: u8,
    padding1: u8,
    padding2: u8,
    padding3: u8,
    xrel: i16,
    yrel: i16,
};

// Joystick hat event structure
pub const JoyHat = extern struct {
    type: EventType,
    reserved: u32,
    timestamp: u64,
    which: core.JoystickID,
    hat: u8,
    value: u8,
    padding1: u8,
    padding2: u8,
};

// Joystick button event structure
pub const JoyButton = extern struct {
    type: EventType,
    reserved: u32,
    timestamp: u64,
    which: core.JoystickID,
    button: u8,
    down: bool,
    padding1: u8,
    padding2: u8,
};

// Joystick battery event structure
pub const JoyBattery = extern struct {
    type: EventType,
    reserved: u32,
    timestamp: u64,
    which: core.JoystickID,
    state: power.PowerState,
    percent: c_int,
};

// Gamepad device event structure
pub const GamepadDevice = extern struct {
    type: EventType,
    reserved: u32,
    timestamp: u64,
    which: core.JoystickID,
};

// Gamepad axis event structure
pub const GamepadAxis = extern struct {
    type: EventType,
    reserved: u32,
    timestamp: u64,
    which: core.JoystickID,
    axis: u8, // GamepadAxis
    padding1: u8,
    padding2: u8,
    padding3: u8,
    value: i16,
    padding4: u16,
};

// Gamepad button event structure
pub const GamepadButton = extern struct {
    type: EventType,
    reserved: u32,
    timestamp: u64,
    which: core.JoystickID,
    button: u8, // GamepadButton
    down: bool,
    padding1: u8,
    padding2: u8,
};

// Gamepad touchpad event structure
pub const GamepadTouchpad = extern struct {
    type: EventType,
    reserved: u32,
    timestamp: u64,
    which: core.JoystickID,
    touchpad: i32,
    finger: i32,
    x: f32,
    y: f32,
    pressure: f32,
};

// Gamepad sensor event structure
pub const GamepadSensor = extern struct {
    type: EventType,
    reserved: u32,
    timestamp: u64,
    which: core.JoystickID,
    sensor: i32, // SensorType
    data: [3]f32,
    sensor_timestamp: u64,
};

// Audio device event structure
pub const AudioDevice = extern struct {
    type: EventType,
    reserved: u32,
    timestamp: u64,
    which: u32, // AudioDeviceID
    recording: bool,
    padding1: u8,
    padding2: u8,
    padding3: u8,
};

// Camera device event structure
pub const CameraDevice = extern struct {
    type: EventType,
    reserved: u32,
    timestamp: u64,
    which: camera.ID,
};

// Sensor event structure
pub const Sensor = extern struct {
    type: EventType,
    reserved: u32,
    timestamp: u64,
    which: sensor.ID,
    data: [6]f32,
    sensor_timestamp: u64,
};

// Touch finger event structure
pub const TouchFinger = extern struct {
    type: EventType,
    reserved: u32,
    timestamp: u64,
    touchID: touch.ID,
    fingerID: FingerID,
    x: f32,
    y: f32,
    dx: f32,
    dy: f32,
    pressure: f32,
    windowID: WindowID,
};

// Pinch finger event structure
pub const PinchFinger = extern struct {
    type: EventType,
    reserved: u32,
    timestamp: u64,
    scale: f32,
    windowID: WindowID,
};

// Pen proximity event structure
pub const PenProximity = extern struct {
    type: EventType,
    reserved: u32,
    timestamp: u64,
    windowID: WindowID,
    which: core.PenID,
};

// Pen motion event structure
pub const PenMotion = extern struct {
    type: EventType,
    reserved: u32,
    timestamp: u64,
    windowID: WindowID,
    which: core.PenID,
    pen_state: u32, // PenInputFlags
    x: f32,
    y: f32,
};

// Pen touch event structure
pub const PenTouch = extern struct {
    type: EventType,
    reserved: u32,
    timestamp: u64,
    windowID: WindowID,
    which: core.PenID,
    pen_state: u32, // PenInputFlags
    x: f32,
    y: f32,
    eraser: bool,
    down: bool,
};

// Pen button event structure
pub const PenButton = extern struct {
    type: EventType,
    reserved: u32,
    timestamp: u64,
    windowID: WindowID,
    which: core.PenID,
    pen_state: u32, // PenInputFlags
    x: f32,
    y: f32,
    button: u8,
    down: bool,
};

// Pen axis event structure
pub const PenAxis = extern struct {
    type: EventType,
    reserved: u32,
    timestamp: u64,
    windowID: WindowID,
    which: core.PenID,
    pen_state: u32, // PenInputFlags
    x: f32,
    y: f32,
    axis: pen.Axis,
    value: f32,
};

// Drop event structure
pub const Drop = extern struct {
    type: EventType,
    reserved: u32,
    timestamp: u64,
    windowID: WindowID,
    x: f32,
    y: f32,
    source: [*c]const u8,
    data: [*c]const u8,
};

// Clipboard event structure
pub const Clipboard = extern struct {
    type: EventType,
    reserved: u32,
    timestamp: u64,
    owner: bool,
    padding1: u8,
    padding2: u8,
    padding3: u8,
    num_mime_types: i32,
    mime_types: [*c]const [*c]const u8,
};

// User event structure
pub const User = extern struct {
    type: u32, // u32 because user events are not in EventType enum
    reserved: u32,
    timestamp: u64,
    windowID: WindowID,
    code: i32,
    data1: ?*anyopaque,
    data2: ?*anyopaque,
};

// Render event structure
pub const Render = extern struct {
    type: EventType,
    reserved: u32,
    timestamp: u64,
    windowID: WindowID,
};

// Event action enum
pub const Action = enum(c_int) {
    ADDEVENT,
    PEEKEVENT,
    GETEVENT,
};

// === Event Functions ===
extern fn SDL_PumpEvents() void;
extern fn SDL_PollEvent(event: ?*Event) bool;
extern fn SDL_WaitEvent(event: ?*Event) bool;
extern fn SDL_WaitEventTimeout(event: ?*Event, timeoutMS: i32) bool;
extern fn SDL_PushEvent(event: ?*const Event) bool;
extern fn SDL_FilterEvents(callback: ?*const fn (?*anyopaque, ?*Event) callconv(.c) bool, userdata: ?*anyopaque) void;
extern fn SDL_AddEventWatch(callback: ?*const fn (?*anyopaque, ?*Event) callconv(.c) bool, userdata: ?*anyopaque) bool;
extern fn SDL_RemoveEventWatch(callback: ?*const fn (?*anyopaque, ?*Event) callconv(.c) bool, userdata: ?*anyopaque) void;
extern fn SDL_PeepEvents(events: ?[*]Event, numevents: c_int, action: Action, minType: EventType, maxType: EventType) c_int;
extern fn SDL_HasEvent(type: EventType) bool;
extern fn SDL_HasEvents(minType: EventType, maxType: EventType) bool;
extern fn SDL_FlushEvent(type: EventType) void;
extern fn SDL_FlushEvents(minType: EventType, maxType: EventType) void;
extern fn SDL_SetEventEnabled(type: EventType, enabled: bool) void;
extern fn SDL_EventEnabled(type: EventType) bool;
extern fn SDL_RegisterEvents(numevents: c_int) EventType;
extern fn SDL_GetEventFilter(filter: ?*?*const fn (?*anyopaque, ?*Event) callconv(.c) bool, userdata: ?*?*anyopaque) bool;
extern fn SDL_SetEventFilter(filter: ?*const fn (?*anyopaque, ?*Event) callconv(.c) bool, userdata: ?*anyopaque) void;
extern fn SDL_GetEventDescription(event: ?*const Event, buf: [*]u8, buflen: c_int) c_int;
extern fn SDL_GetWindowFromEvent(event: ?*const Event) ?*video.WindowType;

// === Public API ===
// Basic event handling
pub const pumpEvents = SDL_PumpEvents;
pub const pollEvent = SDL_PollEvent;
pub const waitEvent = SDL_WaitEvent;
pub const waitEventTimeout = SDL_WaitEventTimeout;
pub const pushEvent = SDL_PushEvent;
pub const filterEvents = SDL_FilterEvents;
pub const addEventWatch = SDL_AddEventWatch;
pub const removeEventWatch = SDL_RemoveEventWatch;
pub const peepEvents = SDL_PeepEvents;
pub const hasEvent = SDL_HasEvent;
pub const hasEvents = SDL_HasEvents;
pub const flushEvent = SDL_FlushEvent;
pub const flushEvents = SDL_FlushEvents;
pub const setEventEnabled = SDL_SetEventEnabled;
pub const eventEnabled = SDL_EventEnabled;
pub const registerEvents = SDL_RegisterEvents;
pub const getEventFilter = SDL_GetEventFilter;
pub const setEventFilter = SDL_SetEventFilter;
pub const getEventDescription = SDL_GetEventDescription;
pub const getWindowFromEvent = SDL_GetWindowFromEvent;

// === Utility Functions ===
/// Check if an event is a window event
pub fn isWindowEvent(eventType: EventType) bool {
    return eventType >= WINDOW_FIRST and eventType <= WINDOW_LAST;
}

/// Check if an event is a keyboard event
pub fn isKeyboardEvent(eventType: EventType) bool {
    return eventType >= KEY_DOWN and eventType <= SCREEN_KEYBOARD_HIDDEN;
}

/// Check if an event is a mouse event
pub fn isMouseEvent(eventType: EventType) bool {
    return eventType >= MOUSE_MOTION and eventType <= MOUSE_REMOVED;
}

/// Check if an event is a gamepad event
pub fn isGamepadEvent(eventType: EventType) bool {
    return eventType >= GAMEPAD_AXIS_MOTION and eventType <= GAMEPAD_STEAM_HANDLE_UPDATED;
}

/// Check if an event is a joystick event
pub fn isJoystickEvent(eventType: EventType) bool {
    return eventType >= JOYSTICK_AXIS_MOTION and eventType <= JOYSTICK_UPDATE_COMPLETE;
}

/// Check if an event is a touch event
pub fn isTouchEvent(eventType: EventType) bool {
    return eventType >= FINGER_DOWN and eventType <= FINGER_CANCELED;
}

/// Check if an event is a pinch event
pub fn isPinchEvent(eventType: EventType) bool {
    return eventType >= PINCH_BEGIN and eventType <= PINCH_END;
}

/// Check if an event is a drop event
pub fn isDropEvent(eventType: EventType) bool {
    return eventType >= DROP_FILE and eventType <= DROP_POSITION;
}

/// Check if an event is an audio device event
pub fn isAudioDeviceEvent(eventType: EventType) bool {
    return eventType >= AUDIO_DEVICE_ADDED and eventType <= AUDIO_DEVICE_FORMAT_CHANGED;
}

/// Check if an event is a camera event
pub fn isCameraEvent(eventType: EventType) bool {
    return eventType >= CAMERA_DEVICE_ADDED and eventType <= CAMERA_DEVICE_DENIED;
}

/// Check if an event is a pen event
pub fn isPenEvent(eventType: EventType) bool {
    return eventType >= PEN_PROXIMITY_IN and eventType <= PEN_AXIS;
}

/// Check if an event is a display event
pub fn isDisplayEvent(eventType: EventType) bool {
    return eventType >= DISPLAY_FIRST and eventType <= DISPLAY_LAST;
}

/// Check if an event is a render event
pub fn isRenderEvent(eventType: EventType) bool {
    return eventType >= RENDER_TARGETS_RESET and eventType <= RENDER_DEVICE_LOST;
}

/// Check if an event is a user event
pub fn isUserEvent(eventType: EventType) bool {
    return eventType >= USER;
}
