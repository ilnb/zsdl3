// SDL3 Core Bindings
// Basic types, initialization, error handling, app metadata, version

// Basic types
pub const Time = i64;

// Window and display IDs
pub const DisplayID = u32;
pub const WindowID = u32;
pub const KeyboardID = u32;
pub const PenID = u32;
pub const JoystickID = u32;
pub const GamepadID = u32;
pub const Keymod = c_int;
pub const Keycode = c_int;
pub const Scancode = c_int;

// Initialization flags
pub const InitFlags = u32;
pub const INIT_AUDIO: InitFlags = 0x00000010;
pub const INIT_VIDEO: InitFlags = 0x00000020;
pub const INIT_JOYSTICK: InitFlags = 0x00000200;
pub const INIT_HAPTIC: InitFlags = 0x00001000;
pub const INIT_GAMEPAD: InitFlags = 0x00002000;
pub const INIT_EVENTS: InitFlags = 0x00004000;
pub const INIT_SENSOR: InitFlags = 0x00008000;
pub const INIT_CAMERA: InitFlags = 0x00010000;

// App result enum
pub const AppResult = enum(c_int) {
    CONTINUE,
    SUCCESS,
    FAILURE,
};

// Function pointers for app callbacks
pub const AppInit_fn = ?*const fn (?*anyopaque, c_int, ?[*]?[*:0]u8) callconv(.c) AppResult;
pub const AppIterate_fn = ?*const fn (?*anyopaque) callconv(.c) AppResult;
const events = @import("events.zig");
pub const AppEvent_fn = ?*const fn (?*anyopaque, ?*events.Event) callconv(.c) AppResult;
pub const AppQuit_fn = ?*const fn (?*anyopaque, AppResult) callconv(.c) void;

// Main thread callback
pub const MainThreadCallback = ?*const fn (?*anyopaque) callconv(.c) void;

// Event types
pub const EventType = c_uint;
pub const EVENT_FIRST = 0;
pub const EVENT_QUIT = 0x100;
pub const EVENT_KEY_DOWN = 0x300;
pub const EVENT_KEY_UP = 0x301;
pub const EVENT_MOUSE_MOTION = 0x400;
pub const EVENT_MOUSE_BUTTON_DOWN = 0x401;
pub const EVENT_MOUSE_BUTTON_UP = 0x402;
pub const EVENT_MOUSE_WHEEL = 0x403;

// Property constants
pub const PROP_APP_METADATA_NAME_STRING = "SDL.app.metadata.name";
pub const PROP_APP_METADATA_VERSION_STRING = "SDL.app.metadata.version";
pub const PROP_APP_METADATA_IDENTIFIER_STRING = "SDL.app.metadata.identifier";
pub const PROP_APP_METADATA_CREATOR_STRING = "SDL.app.metadata.creator";
pub const PROP_APP_METADATA_COPYRIGHT_STRING = "SDL.app.metadata.copyright";
pub const PROP_APP_METADATA_URL_STRING = "SDL.app.metadata.url";
pub const PROP_APP_METADATA_TYPE_STRING = "SDL.app.metadata.type";

// Extern functions
extern fn SDL_Init(flags: InitFlags) bool;
extern fn SDL_InitSubSystem(flags: InitFlags) bool;
extern fn SDL_QuitSubSystem(flags: InitFlags) void;
extern fn SDL_WasInit(flags: InitFlags) InitFlags;
extern fn SDL_Quit() void;
extern fn SDL_IsMainThread() bool;
extern fn SDL_RunOnMainThread(callback: MainThreadCallback, userdata: ?*anyopaque, wait_complete: bool) bool;
extern fn SDL_SetAppMetadata(appname: ?[*:0]const u8, appversion: ?[*:0]const u8, appidentifier: ?[*:0]const u8) bool;
extern fn SDL_SetAppMetadataProperty(name: [*:0]const u8, value: ?[*:0]const u8) bool;
extern fn SDL_GetAppMetadataProperty(name: [*:0]const u8) ?[*:0]const u8;
extern fn SDL_GetError() ?[*:0]const u8;
extern fn SDL_ClearError() bool;
extern fn SDL_SetError(fmt: [*:0]const u8, ...) bool;
extern fn SDL_SetErrorV(fmt: [*:0]const u8, ap: [*c]u8) bool; // va_list is platform-specific, using [*c]u8 as approximation
extern fn SDL_OutOfMemory() bool;

// Version
pub const Version = extern struct {
    major: u8,
    minor: u8,
    patch: u8,
};

extern fn SDL_GetVersion() c_int;
extern fn SDL_GetRevision() ?[*:0]const u8;

// Public API
pub const init = SDL_Init;
pub const initSubSystem = SDL_InitSubSystem;
pub const quitSubSystem = SDL_QuitSubSystem;
pub const wasInit = SDL_WasInit;
pub const quit = SDL_Quit;
pub const isMainThread = SDL_IsMainThread;
pub const runOnMainThread = SDL_RunOnMainThread;
pub const setAppMetadata = SDL_SetAppMetadata;
pub const setAppMetadataProp = SDL_SetAppMetadataProperty;
pub const getAppMetadataProp = SDL_GetAppMetadataProperty;
pub const getError = SDL_GetError;
pub const clearError = SDL_ClearError;
pub const setError = SDL_SetError;
pub const setErrorV = SDL_SetErrorV;
pub const outOfMemory = SDL_OutOfMemory;
pub const getVersion = SDL_GetVersion;
pub const getRevision = SDL_GetRevision;
