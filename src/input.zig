// SDL3 Input Bindings
// Keyboard, mouse, joystick, gamepad, touch, pen, sensors, HIDAPI

const core = @import("core.zig");
const WindowID = core.WindowID;
const JoystickID = core.JoystickID;
const SensorID = sensor.ID;
const KeyboardID = u32;
const Keymod = core.Keymod;
const Keycode = core.Keycode;
const Scancode = core.Scancode;
pub const MouseID = u32;
pub const MouseButtonFlags = u32;
const guid = @import("guid.zig");
const GUID = guid.GUID;
const props = @import("props.zig");
const sensor = @import("sensor.zig");
const Sensor = sensor.Sensor;
const SensorType = sensor.Type;
const surface = @import("surface.zig");
const touch = @import("touch.zig");
const TouchID = touch.ID;
const DeviceType = touch.DeviceType;
const FingerID = touch.FingerID;
const Finger = touch.Finger;
const video = @import("video.zig");
const Cursor = video.Cursor;

// Import types
// Joystick type
pub const JoystickType = enum(c_int) {
    UNKNOWN,
    GAMEPAD,
    WHEEL,
    ARCADE_STICK,
    FLIGHT_STICK,
    DANCE_PAD,
    GUITAR,
    DRUM_KIT,
    ARCADE_PAD,
    THROTTLE,
};

// Gamepad type
pub const GamepadType = enum(c_int) {
    UNKNOWN = 0,
    STANDARD,
    XBOX360,
    XBOXONE,
    PS3,
    PS4,
    PS5,
    NINTENDO_SWITCH_PRO,
    NINTENDO_SWITCH_JOYCON_LEFT,
    NINTENDO_SWITCH_JOYCON_RIGHT,
    NINTENDO_SWITCH_JOYCON_PAIR,
    GAMECUBE,
    COUNT,
};

// Gamepad axis
pub const GamepadAxis = enum(c_int) {
    INVALID = -1,
    LEFTX,
    LEFTY,
    RIGHTX,
    RIGHTY,
    LEFT_TRIGGER,
    RIGHT_TRIGGER,
    COUNT,
};

// Gamepad button
pub const GamepadButton = enum(c_int) {
    INVALID = -1,
    SOUTH,
    EAST,
    WEST,
    NORTH,
    BACK,
    GUIDE,
    START,
    LEFT_STICK,
    RIGHT_STICK,
    LEFT_SHOULDER,
    RIGHT_SHOULDER,
    DPAD_UP,
    DPAD_DOWN,
    DPAD_LEFT,
    DPAD_RIGHT,
    MISC1,
    RIGHT_PADDLE1,
    LEFT_PADDLE1,
    RIGHT_PADDLE2,
    LEFT_PADDLE2,
    TOUCHPAD,
    MISC2,
    MISC3,
    MISC4,
    MISC5,
    MISC6,
    COUNT,
};

// Gamepad button label
pub const GamepadButtonLabel = enum(c_int) {
    UNKNOWN,
    A,
    B,
    X,
    Y,
    CROSS,
    CIRCLE,
    SQUARE,
    TRIANGLE,
};

// Gamepad binding
pub const GamepadBindingType = enum(c_int) {
    NONE = 0,
    BUTTON,
    AXIS,
    HAT,
};

pub const GamepadBinding = extern struct {
    input_type: GamepadBindingType,
    input: extern union {
        button: c_int,
        axis: extern struct {
            axis: c_int,
            axis_min: c_int,
            axis_max: c_int,
        },
        hat: extern struct {
            hat: c_int,
            hat_mask: c_int,
        },
    },
    output_type: GamepadBindingType,
    output: extern union {
        button: GamepadButton,
        axis: extern struct {
            axis: GamepadAxis,
            axis_min: c_int,
            axis_max: c_int,
        },
    },
};

// Keyboard
// Mouse
pub const SystemCursor = enum(c_int) {
    DEFAULT,
    TEXT,
    WAIT,
    CROSSHAIR,
    PROGRESS,
    NWSE_RESIZE,
    NESW_RESIZE,
    EW_RESIZE,
    NS_RESIZE,
    MOVE,
    NOT_ALLOWED,
    POINTER,
    NW_RESIZE,
    N_RESIZE,
    NE_RESIZE,
    E_RESIZE,
    SE_RESIZE,
    S_RESIZE,
    SW_RESIZE,
    W_RESIZE,
    COUNT,
};
pub const MouseWheelDirection = enum(c_int) {
    NORMAL,
    FLIPPED,
};

// Special mouse IDs for touch/pen virtual mouse
pub const TOUCH_MOUSEID: MouseID = 0xFFFFFFFF;
pub const PEN_MOUSEID: MouseID = 0xFFFFFFFE;

// Joystick/Gamepad
pub const Joystick = opaque {};
pub const Gamepad = opaque {};

// Keyboard functions
extern fn SDL_HasKeyboard() bool;
extern fn SDL_GetKeyboards(count: ?*c_int) ?[*]KeyboardID;
extern fn SDL_GetKeyboardNameForID(instance_id: KeyboardID) ?[*:0]const u8;
extern fn SDL_GetKeyboardFocus() ?*video.WindowType;
extern fn SDL_GetKeyboardState(numkeys: ?*c_int) ?[*]const bool;
extern fn SDL_ResetKeyboard() void;
extern fn SDL_GetModState() Keymod;
extern fn SDL_SetModState(modstate: Keymod) void;
extern fn SDL_GetKeyFromScancode(scancode: Scancode, modstate: Keymod, key_event: bool) Keycode;
extern fn SDL_GetScancodeFromKey(key: Keycode, modstate: ?*Keymod) Scancode;
extern fn SDL_SetScancodeName(scancode: Scancode, name: [*:0]const u8) bool;
extern fn SDL_GetScancodeName(scancode: Scancode) ?[*:0]const u8;
extern fn SDL_GetScancodeFromName(name: [*:0]const u8) Scancode;
extern fn SDL_GetKeyName(key: Keycode) ?[*:0]const u8;
extern fn SDL_GetKeyFromName(name: [*:0]const u8) Keycode;
extern fn SDL_StartTextInput(window: ?*video.WindowType) bool;
extern fn SDL_StartTextInputWithProperties(window: ?*video.WindowType, props: props.ID) bool;
extern fn SDL_StopTextInput(window: ?*video.WindowType) bool;
extern fn SDL_TextInputActive(window: ?*video.WindowType) bool;
extern fn SDL_ClearComposition(window: ?*video.WindowType) bool;
const pixels = @import("pixels.zig");
extern fn SDL_SetTextInputArea(window: ?*video.WindowType, rect: ?*const pixels.Rect, cursor: c_int) bool;
extern fn SDL_GetTextInputArea(window: ?*video.WindowType, rect: ?*pixels.Rect, cursor: ?*c_int) bool;
extern fn SDL_HasScreenKeyboardSupport() bool;
extern fn SDL_ScreenKeyboardShown(window: ?*video.WindowType) bool;

// Mouse functions
extern fn SDL_HasMouse() bool;
extern fn SDL_GetMice(count: ?*c_int) ?[*]MouseID;
extern fn SDL_GetMouseNameForID(instance_id: MouseID) ?[*:0]const u8;
extern fn SDL_GetMouseFocus() ?*video.WindowType;
extern fn SDL_GetMouseState(x: ?*f32, y: ?*f32) MouseButtonFlags;
extern fn SDL_GetGlobalMouseState(x: ?*f32, y: ?*f32) MouseButtonFlags;
extern fn SDL_GetRelativeMouseState(x: ?*f32, y: ?*f32) MouseButtonFlags;
extern fn SDL_WarpMouseInWindow(window: ?*video.WindowType, x: f32, y: f32) void;
extern fn SDL_WarpMouseGlobal(x: f32, y: f32) bool;
extern fn SDL_CaptureMouse(enabled: bool) bool;

extern fn SDL_SetWindowRelativeMouseMode(window: ?*video.WindowType, enabled: bool) bool;
extern fn SDL_GetWindowRelativeMouseMode(window: ?*video.WindowType) bool;
extern fn SDL_SetRelativeMouseTransform(callback: ?*const fn (?*anyopaque, u64, ?*video.WindowType, MouseID, ?*f32, ?*f32) callconv(.c) void, userdata: ?*anyopaque) bool;

// Cursor functions
pub const CursorFrameInfo = extern struct {
    surface: ?*surface.Surface,
    duration: u32,
};
extern fn SDL_CreateCursor(data: ?[*]const u8, mask: ?[*]const u8, w: c_int, h: c_int, hot_x: c_int, hot_y: c_int) ?*Cursor;
extern fn SDL_CreateColorCursor(surface: ?*surface.Surface, hot_x: c_int, hot_y: c_int) ?*Cursor;
extern fn SDL_CreateAnimatedCursor(frames: ?[*]CursorFrameInfo, frame_count: c_int, hot_x: c_int, hot_y: c_int) ?*Cursor;
extern fn SDL_CreateSystemCursor(id: SystemCursor) ?*Cursor;
extern fn SDL_SetCursor(cursor: ?*Cursor) bool;
extern fn SDL_GetCursor() ?*Cursor;
extern fn SDL_GetDefaultCursor() ?*Cursor;
extern fn SDL_DestroyCursor(cursor: ?*Cursor) void;
extern fn SDL_ShowCursor() bool;
extern fn SDL_HideCursor() bool;
extern fn SDL_CursorVisible() bool;

// Joystick functions
extern fn SDL_GetJoysticks(count: ?*c_int) ?[*]JoystickID;
extern fn SDL_OpenJoystick(instance_id: c_int) ?*Joystick;
extern fn SDL_CloseJoystick(joystick: ?*Joystick) void;
extern fn SDL_GetJoystickName(joystick: ?*Joystick) ?[*:0]const u8;
extern fn SDL_GetJoystickPath(joystick: ?*Joystick) ?[*:0]const u8;
extern fn SDL_GetJoystickType(joystick: ?*Joystick) JoystickType;
extern fn SDL_GetJoystickGUID(joystick: ?*Joystick) GUID;
extern fn SDL_GetJoystickVendor(joystick: ?*Joystick) u16;
extern fn SDL_GetJoystickProduct(joystick: ?*Joystick) u16;
extern fn SDL_GetJoystickProductVersion(joystick: ?*Joystick) u16;
extern fn SDL_GetJoystickFirmwareVersion(joystick: ?*Joystick) u16;
extern fn SDL_GetJoystickSerial(joystick: ?*Joystick) ?[*:0]const u8;
extern fn SDL_GetJoystickAxis(joystick: ?*Joystick, axis: c_int) i16;
extern fn SDL_GetJoystickHat(joystick: ?*Joystick, hat: c_int) u8;
extern fn SDL_GetJoystickBall(joystick: ?*Joystick, ball: c_int, dx: ?*c_int, dy: ?*c_int) bool;
extern fn SDL_GetJoystickButton(joystick: ?*Joystick, button: c_int) bool;
extern fn SDL_RumbleJoystick(joystick: ?*Joystick, low_frequency_rumble: u16, high_frequency_rumble: u16, duration_ms: u32) bool;
extern fn SDL_RumbleJoystickTriggers(joystick: ?*Joystick, left_rumble: u16, right_rumble: u16, duration_ms: u32) bool;
extern fn SDL_SetJoystickLED(joystick: ?*Joystick, red: u8, green: u8, blue: u8) bool;
extern fn SDL_SendJoystickEffect(joystick: ?*Joystick, data: ?*anyopaque, size: c_int) bool;

// Gamepad functions

extern fn SDL_IsGamepad(instance_id: c_int) bool;
extern fn SDL_OpenGamepad(instance_id: c_int) ?*Gamepad;
extern fn SDL_CloseGamepad(gamepad: ?*Gamepad) void;
extern fn SDL_GetGamepadName(gamepad: ?*Gamepad) ?[*:0]const u8;
extern fn SDL_GetGamepadPath(gamepad: ?*Gamepad) ?[*:0]const u8;
extern fn SDL_GetGamepadType(gamepad: ?*Gamepad) GamepadType;

extern fn SDL_GetGamepadVendor(gamepad: ?*Gamepad) u16;
extern fn SDL_GetGamepadProduct(gamepad: ?*Gamepad) u16;
extern fn SDL_GetGamepadProductVersion(gamepad: ?*Gamepad) u16;
extern fn SDL_GetGamepadFirmwareVersion(gamepad: ?*Gamepad) u16;
extern fn SDL_GetGamepadSerial(gamepad: ?*Gamepad) ?[*:0]const u8;
extern fn SDL_GamepadHasAxis(gamepad: ?*Gamepad, axis: GamepadAxis) bool;
extern fn SDL_GetGamepadAxis(gamepad: ?*Gamepad, axis: GamepadAxis) i16;
extern fn SDL_GamepadHasButton(gamepad: ?*Gamepad, button: GamepadButton) bool;
extern fn SDL_GetGamepadButton(gamepad: ?*Gamepad, button: GamepadButton) bool;
extern fn SDL_GetGamepadButtonLabel(gamepad: ?*Gamepad, button: GamepadButton) GamepadButtonLabel;
extern fn SDL_SetGamepadEventsEnabled(enabled: bool) void;
extern fn SDL_GamepadEventsEnabled() bool;
extern fn SDL_GetGamepadBindings(gamepad: ?*Gamepad, count: ?*c_int) ?[*]?*GamepadBinding;
extern fn SDL_ReloadGamepadMappings() bool;
extern fn SDL_GetGamepadMapping(gamepad: ?*Gamepad) ?[*:0]const u8;
extern fn SDL_AddGamepadMapping(mapping: ?[*:0]const u8) c_int;
const fs = @import("fs.zig");
extern fn SDL_AddGamepadMappingsFromFile(file: [*:0]const u8) c_int;
extern fn SDL_AddGamepadMappingsFromIO(src: ?*fs.IOStream, closeio: bool) c_int;
extern fn SDL_GetGamepadMappings(count: ?*c_int) ?[*]?[*:0]u8;
extern fn SDL_GetGamepadMappingForGUID(guid: GUID) ?[*:0]const u8;
extern fn SDL_GetGamepadMappingForID(instance_id: JoystickID) ?[*:0]const u8;
extern fn SDL_SetGamepadMapping(instance_id: JoystickID, mapping: ?[*:0]const u8) bool;
extern fn SDL_GetGamepadPlayerIndexForID(instance_id: JoystickID) c_int;
extern fn SDL_GetRealGamepadTypeForID(instance_id: JoystickID) GamepadType;
extern fn SDL_GetRealGamepadType(gamepad: ?*Gamepad) GamepadType;
extern fn SDL_GetNumGamepadTouchpads(gamepad: ?*Gamepad) c_int;
extern fn SDL_GetGamepadTouchpadFinger(gamepad: ?*Gamepad, touchpad: c_int, finger: c_int, down: ?*bool, x: ?*f32, y: ?*f32, pressure: ?*f32) bool;
extern fn SDL_GetGamepadAppleSFSymbolsNameForAxis(gamepad: ?*Gamepad, axis: GamepadAxis) ?[*:0]const u8;
extern fn SDL_GetGamepadAppleSFSymbolsNameForButton(gamepad: ?*Gamepad, button: GamepadButton) ?[*:0]const u8;
extern fn SDL_HasGamepad() bool;
extern fn SDL_GetGamepads(count: ?*c_int) ?[*]JoystickID;
extern fn SDL_GetGamepadNameForID(instance_id: JoystickID) ?[*:0]const u8;
extern fn SDL_GetGamepadPathForID(instance_id: JoystickID) ?[*:0]const u8;
extern fn SDL_GetGamepadTypeForID(instance_id: JoystickID) GamepadType;
extern fn SDL_GetGamepadGUIDForID(instance_id: JoystickID) GUID;
extern fn SDL_GetGamepadVendorForID(instance_id: JoystickID) u16;
extern fn SDL_GetGamepadProductForID(instance_id: JoystickID) u16;
extern fn SDL_GetGamepadProductVersionForID(instance_id: JoystickID) u16;
extern fn SDL_GetGamepadFirmwareVersionForID(instance_id: JoystickID) u16;
extern fn SDL_GetGamepadSerialForID(instance_id: JoystickID) ?[*:0]const u8;
extern fn SDL_GamepadConnected(gamepad: ?*Gamepad) bool;
extern fn SDL_GetGamepadID(gamepad: ?*Gamepad) JoystickID;
extern fn SDL_GetGamepadFromID(instance_id: JoystickID) ?*Gamepad;
extern fn SDL_GetGamepadFromPlayerIndex(player_index: c_int) ?*Gamepad;
extern fn SDL_GetGamepadPlayerIndex(gamepad: ?*Gamepad) c_int;
extern fn SDL_SetGamepadPlayerIndex(gamepad: ?*Gamepad, player_index: c_int) bool;
extern fn SDL_RumbleGamepad(gamepad: ?*Gamepad, low_frequency_rumble: u16, high_frequency_rumble: u16, duration_ms: u32) bool;
extern fn SDL_RumbleGamepadTriggers(gamepad: ?*Gamepad, left_rumble: u16, right_rumble: u16, duration_ms: u32) bool;
extern fn SDL_SetGamepadLED(gamepad: ?*Gamepad, red: u8, green: u8, blue: u8) bool;
extern fn SDL_SendGamepadEffect(gamepad: ?*Gamepad, data: ?*anyopaque, size: c_int) bool;
extern fn SDL_GetGamepadSensorData(gamepad: ?*Gamepad, sensor: SensorType, data: ?[*]f32, num_values: c_int) bool;
extern fn SDL_SetGamepadSensorEnabled(gamepad: ?*Gamepad, sensor: SensorType, enabled: bool) bool;
extern fn SDL_GamepadSensorEnabled(gamepad: ?*Gamepad, sensor: SensorType) bool;
extern fn SDL_GetGamepadProperties(gamepad: ?*Gamepad) props.ID;

//Touch functions
extern fn SDL_GetTouchDeviceType(device_id: TouchID) DeviceType;

//Sensor functions
extern fn SDL_GetSensorFromID(instance_id: SensorID) ?*Sensor;
extern fn SDL_GetSensorName(sensor: ?*Sensor) ?[*:0]const u8;
extern fn SDL_GetSensorType(sensor: ?*Sensor) SensorType;
extern fn SDL_GetSensorNonPortableType(sensor: ?*Sensor) c_int;
extern fn SDL_GetSensorInstanceID(sensor: ?*Sensor) SensorID;

// Public API
pub const hasKeyboard = SDL_HasKeyboard;
pub const getKeyboards = SDL_GetKeyboards;
pub const getKeyboardNameForID = SDL_GetKeyboardNameForID;
pub const getKeyboardFocus = SDL_GetKeyboardFocus;
pub const resetKeyboard = SDL_ResetKeyboard;
pub const getKeyboardState = SDL_GetKeyboardState;
pub const getModState = SDL_GetModState;
pub const setModState = SDL_SetModState;
pub const getKeyFromScancode = SDL_GetKeyFromScancode;
pub const getScancodeFromKey = SDL_GetScancodeFromKey;
pub const setScancodeName = SDL_SetScancodeName;
pub const getScancodeName = SDL_GetScancodeName;
pub const getScancodeFromName = SDL_GetScancodeFromName;
pub const getKeyName = SDL_GetKeyName;
pub const getKeyFromName = SDL_GetKeyFromName;
pub const startTextInput = SDL_StartTextInput;
pub const startTextInputWithProps = SDL_StartTextInputWithProperties;
pub const stopTextInput = SDL_StopTextInput;
pub const textInputActive = SDL_TextInputActive;
pub const clearComposition = SDL_ClearComposition;
pub const setTextInputArea = SDL_SetTextInputArea;
pub const getTextInputArea = SDL_GetTextInputArea;
pub const hasScreenKeyboardSupport = SDL_HasScreenKeyboardSupport;
pub const screenKeyboardShown = SDL_ScreenKeyboardShown;
pub const hasMouse = SDL_HasMouse;
pub const getMice = SDL_GetMice;
pub const getMouseNameForID = SDL_GetMouseNameForID;
pub const getMouseFocus = SDL_GetMouseFocus;
pub const getMouseState = SDL_GetMouseState;
pub const getGlobalMouseState = SDL_GetGlobalMouseState;
pub const getRelativeMouseState = SDL_GetRelativeMouseState;
pub const warpMouseInWindow = SDL_WarpMouseInWindow;
pub const warpMouseGlobal = SDL_WarpMouseGlobal;
pub const captureMouse = SDL_CaptureMouse;
pub const setWindowRelativeMouseMode = SDL_SetWindowRelativeMouseMode;
pub const getWindowRelativeMouseMode = SDL_GetWindowRelativeMouseMode;
pub const setRelativeMouseTransform = SDL_SetRelativeMouseTransform;
pub const createCursor = SDL_CreateCursor;
pub const createColorCursor = SDL_CreateColorCursor;
pub const createAnimatedCursor = SDL_CreateAnimatedCursor;
pub const createSystemCursor = SDL_CreateSystemCursor;
pub const setCursor = SDL_SetCursor;
pub const getCursor = SDL_GetCursor;
pub const getDefaultCursor = SDL_GetDefaultCursor;
pub const destroyCursor = SDL_DestroyCursor;
pub const showCursor = SDL_ShowCursor;
pub const hideCursor = SDL_HideCursor;
pub const cursorVisible = SDL_CursorVisible;
pub const getJoysticks = SDL_GetJoysticks;
pub const openJoystick = SDL_OpenJoystick;
pub const closeJoystick = SDL_CloseJoystick;
pub const getJoystickName = SDL_GetJoystickName;
pub const getJoystickPath = SDL_GetJoystickPath;
pub const getJoystickType = SDL_GetJoystickType;
pub const getJoystickGUID = SDL_GetJoystickGUID;
pub const getJoystickVendor = SDL_GetJoystickVendor;
pub const getJoystickProduct = SDL_GetJoystickProduct;
pub const getJoystickProductVersion = SDL_GetJoystickProductVersion;
pub const getJoystickFirmwareVersion = SDL_GetJoystickFirmwareVersion;
pub const getJoystickSerial = SDL_GetJoystickSerial;
pub const getJoystickAxis = SDL_GetJoystickAxis;
pub const getJoystickHat = SDL_GetJoystickHat;
pub const getJoystickBall = SDL_GetJoystickBall;
pub const getJoystickButton = SDL_GetJoystickButton;
pub const rumbleJoystick = SDL_RumbleJoystick;
pub const rumbleJoystickTriggers = SDL_RumbleJoystickTriggers;
pub const setJoystickLED = SDL_SetJoystickLED;
pub const sendJoystickEffect = SDL_SendJoystickEffect;
pub const isGamepad = SDL_IsGamepad;
pub const openGamepad = SDL_OpenGamepad;
pub const closeGamepad = SDL_CloseGamepad;
pub const getGamepadName = SDL_GetGamepadName;
pub const getGamepadPath = SDL_GetGamepadPath;
pub const getGamepadType = SDL_GetGamepadType;
pub const getGamepadVendor = SDL_GetGamepadVendor;
pub const getGamepadProduct = SDL_GetGamepadProduct;
pub const getGamepadProductVersion = SDL_GetGamepadProductVersion;
pub const getGamepadFirmwareVersion = SDL_GetGamepadFirmwareVersion;
pub const getGamepadSerial = SDL_GetGamepadSerial;
pub const gamepadHasAxis = SDL_GamepadHasAxis;
pub const getGamepadAxis = SDL_GetGamepadAxis;
pub const gamepadHasButton = SDL_GamepadHasButton;
pub const getGamepadButton = SDL_GetGamepadButton;
pub const getGamepadButtonLabel = SDL_GetGamepadButtonLabel;
pub const setGamepadEventsEnabled = SDL_SetGamepadEventsEnabled;
pub const gamepadEventsEnabled = SDL_GamepadEventsEnabled;
pub const getGamepadBindings = SDL_GetGamepadBindings;
pub const reloadGamepadMappings = SDL_ReloadGamepadMappings;
pub const getGamepadMapping = SDL_GetGamepadMapping;
pub const addGamepadMapping = SDL_AddGamepadMapping;
pub const addGamepadMappingsFromFile = SDL_AddGamepadMappingsFromFile;
pub const addGamepadMappingsFromIO = SDL_AddGamepadMappingsFromIO;
pub const getGamepadMappings = SDL_GetGamepadMappings;
pub const getGamepadMappingForGUID = SDL_GetGamepadMappingForGUID;
pub const getGamepadMappingForID = SDL_GetGamepadMappingForID;
pub const setGamepadMapping = SDL_SetGamepadMapping;
pub const getGamepadPlayerIndexForID = SDL_GetGamepadPlayerIndexForID;
pub const getRealGamepadTypeForID = SDL_GetRealGamepadTypeForID;
pub const getRealGamepadType = SDL_GetRealGamepadType;
pub const getNumGamepadTouchpads = SDL_GetNumGamepadTouchpads;
pub const getGamepadTouchpadFinger = SDL_GetGamepadTouchpadFinger;
pub const getGamepadAppleSFSymbolsNameForAxis = SDL_GetGamepadAppleSFSymbolsNameForAxis;
pub const getGamepadAppleSFSymbolsNameForButton = SDL_GetGamepadAppleSFSymbolsNameForButton;
pub const hasGamepad = SDL_HasGamepad;
pub const getGamepads = SDL_GetGamepads;
pub const getGamepadNameForID = SDL_GetGamepadNameForID;
pub const getGamepadPathForID = SDL_GetGamepadPathForID;
pub const getGamepadTypeForID = SDL_GetGamepadTypeForID;
pub const getGamepadGUIDForID = SDL_GetGamepadGUIDForID;
pub const getGamepadVendorForID = SDL_GetGamepadVendorForID;
pub const getGamepadProductForID = SDL_GetGamepadProductForID;
pub const getGamepadProductVersionForID = SDL_GetGamepadProductVersionForID;
pub const getGamepadFirmwareVersionForID = SDL_GetGamepadFirmwareVersionForID;
pub const getGamepadSerialForID = SDL_GetGamepadSerialForID;
pub const gamepadConnected = SDL_GamepadConnected;
pub const getGamepadID = SDL_GetGamepadID;
pub const getGamepadFromID = SDL_GetGamepadFromID;
pub const getGamepadFromPlayerIndex = SDL_GetGamepadFromPlayerIndex;
pub const getGamepadPlayerIndex = SDL_GetGamepadPlayerIndex;
pub const setGamepadPlayerIndex = SDL_SetGamepadPlayerIndex;
pub const rumbleGamepad = SDL_RumbleGamepad;
pub const rumbleGamepadTriggers = SDL_RumbleGamepadTriggers;
pub const setGamepadLED = SDL_SetGamepadLED;
pub const sendGamepadEffect = SDL_SendGamepadEffect;
pub const getGamepadSensorData = SDL_GetGamepadSensorData;
pub const setGamepadSensorEnabled = SDL_SetGamepadSensorEnabled;
pub const gamepadSensorEnabled = SDL_GamepadSensorEnabled;
pub const getGamepadProps = SDL_GetGamepadProperties;
pub const getTouchDeviceType = SDL_GetTouchDeviceType;
pub const getSensorFromID = SDL_GetSensorFromID;
pub const getSensorName = SDL_GetSensorName;
pub const getSensorType = SDL_GetSensorType;
pub const getSensorNonPortableType = SDL_GetSensorNonPortableType;
pub const getSensorInstanceID = SDL_GetSensorInstanceID;
