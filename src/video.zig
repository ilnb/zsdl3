// SDL3 Video Bindings
// Window management, display handling

const core = @import("core.zig");
const props = @import("props.zig");
const pixels = @import("pixels.zig");

// Import basic types
const DisplayID = core.DisplayID;
const WindowID = core.WindowID;

// Window flags
pub const WindowFlags = u64;
pub const WINDOW_FULLSCREEN: WindowFlags = 0x0000000000000001;
pub const WINDOW_OPENGL: WindowFlags = 0x0000000000000002;
pub const WINDOW_OCCLUDED: WindowFlags = 0x0000000000000004;
pub const WINDOW_HIDDEN: WindowFlags = 0x0000000000000008;
pub const WINDOW_BORDERLESS: WindowFlags = 0x0000000000000010;
pub const WINDOW_RESIZABLE: WindowFlags = 0x0000000000000020;
pub const WINDOW_MINIMIZED: WindowFlags = 0x0000000000000040;
pub const WINDOW_MAXIMIZED: WindowFlags = 0x0000000000000080;
pub const WINDOW_MOUSE_GRABBED: WindowFlags = 0x0000000000000100;
pub const WINDOW_INPUT_FOCUS: WindowFlags = 0x0000000000000200;
pub const WINDOW_MOUSE_FOCUS: WindowFlags = 0x0000000000000400;
pub const WINDOW_EXTERNAL: WindowFlags = 0x0000000000000800;
pub const WINDOW_MODAL: WindowFlags = 0x0000000000001000;
pub const WINDOW_HIGH_PIXEL_DENSITY: WindowFlags = 0x0000000000002000;
pub const WINDOW_MOUSE_CAPTURE: WindowFlags = 0x0000000000004000;
pub const WINDOW_MOUSE_RELATIVE_MODE: WindowFlags = 0x0000000000008000;
pub const WINDOW_ALWAYS_ON_TOP: WindowFlags = 0x0000000000010000;
pub const WINDOW_UTILITY: WindowFlags = 0x0000000000020000;
pub const WINDOW_TOOLTIP: WindowFlags = 0x0000000000040000;
pub const WINDOW_POPUP_MENU: WindowFlags = 0x0000000000080000;
pub const WINDOW_KEYBOARD_GRABBED: WindowFlags = 0x0000000000100000;
pub const WINDOW_FILL_DOCUMENT: WindowFlags = 0x0000000000200000;
pub const WINDOW_VULKAN: WindowFlags = 0x0000000010000000;
pub const WINDOW_METAL: WindowFlags = 0x0000000020000000;
pub const WINDOW_TRANSPARENT: WindowFlags = 0x0000000040000000;
pub const WINDOW_NOT_FOCUSABLE: WindowFlags = 0x0000000080000000;

// Window position macros (simplified)
pub const WINDOWPOS_UNDEFINED: c_int = 0x1FFF0000;
pub const WINDOWPOS_CENTERED: c_int = 0x2FFF0000;

// Flash operation
pub const FlashOperation = enum(c_int) {
    CANCEL,
    BRIEFLY,
    UNTIL_FOCUSED,
};

// Progress state
pub const ProgressState = enum(c_int) {
    INVALID = -1,
    NONE,
    INDETERMINATE,
    NORMAL,
    PAUSED,
    ERROR,
};

// Opaque structs
pub const Cursor = opaque {};
pub const WindowType = opaque {};
pub const GLContext = opaque {};
pub const EGLDisplay = ?*anyopaque;
pub const EGLConfig = ?*anyopaque;
pub const EGLSurface = ?*anyopaque;

// Display mode struct
pub const DisplayMode = extern struct {
    displayID: DisplayID,
    format: c_uint, // PixelFormat
    w: c_int,
    h: c_int,
    pixel_density: f32,
    refresh_rate: f32,
    refresh_rate_numerator: c_int,
    refresh_rate_denominator: c_int,
    internal: ?*anyopaque,
};

// Display orientation
pub const DisplayOrientation = enum(c_int) {
    UNKNOWN,
    LANDSCAPE,
    LANDSCAPE_FLIPPED,
    PORTRAIT,
    PORTRAIT_FLIPPED,
};

// System theme
pub const SystemTheme = enum(c_int) {
    UNKNOWN,
    LIGHT,
    DARK,
};

// Video extern functions
extern fn SDL_GetNumVideoDrivers() c_int;
extern fn SDL_GetVideoDriver(index: c_int) ?[*:0]const u8;
extern fn SDL_GetCurrentVideoDriver() ?[*:0]const u8;
extern fn SDL_GetSystemTheme() SystemTheme;
extern fn SDL_GetDisplays(count: ?*c_int) ?[*]DisplayID;
extern fn SDL_GetPrimaryDisplay() DisplayID;
extern fn SDL_GetDisplayProperties(displayID: DisplayID) props.ID;
extern fn SDL_GetDisplayName(displayID: DisplayID) ?[*:0]const u8;
extern fn SDL_GetDisplayBounds(displayID: DisplayID, rect: ?*Rect) bool;
extern fn SDL_GetDisplayUsableBounds(displayID: DisplayID, rect: ?*Rect) bool;
extern fn SDL_GetNaturalDisplayOrientation(displayID: DisplayID) DisplayOrientation;
extern fn SDL_GetCurrentDisplayOrientation(displayID: DisplayID) DisplayOrientation;
extern fn SDL_GetDisplayContentScale(displayID: DisplayID) f32;
extern fn SDL_GetDesktopDisplayMode(displayID: DisplayID) ?*const DisplayMode;
extern fn SDL_GetCurrentDisplayMode(displayID: DisplayID) ?*const DisplayMode;
extern fn SDL_GetFullscreenDisplayModes(displayID: DisplayID, count: ?*c_int) ?[*]?*DisplayMode;
extern fn SDL_GetClosestFullscreenDisplayMode(displayID: DisplayID, w: c_int, h: c_int, refresh_rate: f32, include_high_density_modes: bool, closest: ?*DisplayMode) bool;
extern fn SDL_GetDisplayForPoint(point: ?*const Point) DisplayID;
extern fn SDL_GetDisplayForRect(rect: ?*const Rect) DisplayID;
extern fn SDL_GetDisplayForWindow(window: ?*WindowType) DisplayID;
extern fn SDL_GetWindowPixelDensity(window: ?*WindowType) f32;
extern fn SDL_GetWindowDisplayScale(window: ?*WindowType) f32;
extern fn SDL_SetWindowFullscreenMode(window: ?*WindowType, mode: ?*const DisplayMode) bool;
extern fn SDL_GetWindowFullscreenMode(window: ?*WindowType) ?*const DisplayMode;
extern fn SDL_GetWindowPixelFormat(window: ?*WindowType) c_uint;
extern fn SDL_GetWindows(count: ?*c_int) ?[*]?*WindowType;
extern fn SDL_CreateWindow(title: ?[*:0]const u8, w: c_int, h: c_int, flags: WindowFlags) ?*WindowType;
extern fn SDL_DestroyWindow(window: ?*WindowType) void;
extern fn SDL_GetWindowID(window: ?*WindowType) WindowID;
extern fn SDL_GetWindowFromID(id: WindowID) ?*WindowType;
extern fn SDL_GetWindowParent(window: ?*WindowType) ?*WindowType;
extern fn SDL_GetWindowProperties(window: ?*WindowType) props.ID;
extern fn SDL_GetWindowFlags(window: ?*WindowType) WindowFlags;
extern fn SDL_SetWindowTitle(window: ?*WindowType, title: ?[*:0]const u8) bool;
extern fn SDL_GetWindowTitle(window: ?*WindowType) ?[*:0]const u8;
extern fn SDL_SetWindowIcon(window: ?*WindowType, icon: ?*Surface) bool;
extern fn SDL_SetWindowPosition(window: ?*WindowType, x: c_int, y: c_int) bool;
extern fn SDL_GetWindowPosition(window: ?*WindowType, x: ?*c_int, y: ?*c_int) bool;
extern fn SDL_SetWindowSize(window: ?*WindowType, w: c_int, h: c_int) bool;
extern fn SDL_GetWindowSize(window: ?*WindowType, w: ?*c_int, h: ?*c_int) bool;
extern fn SDL_GetWindowBordersSize(window: ?*WindowType, top: ?*c_int, left: ?*c_int, bottom: ?*c_int, right: ?*c_int) bool;
extern fn SDL_GetWindowSizeInPixels(window: ?*WindowType, w: ?*c_int, h: ?*c_int) bool;
extern fn SDL_SetWindowMinimumSize(window: ?*WindowType, min_w: c_int, min_h: c_int) bool;
extern fn SDL_GetWindowMinimumSize(window: ?*WindowType, w: ?*c_int, h: ?*c_int) bool;
extern fn SDL_SetWindowMaximumSize(window: ?*WindowType, max_w: c_int, max_h: c_int) bool;
extern fn SDL_GetWindowMaximumSize(window: ?*WindowType, w: ?*c_int, h: ?*c_int) bool;
extern fn SDL_SetWindowBordered(window: ?*WindowType, bordered: bool) bool;
extern fn SDL_SetWindowResizable(window: ?*WindowType, resizable: bool) bool;
extern fn SDL_SetWindowAlwaysOnTop(window: ?*WindowType, on_top: bool) bool;
extern fn SDL_ShowWindow(window: ?*WindowType) bool;
extern fn SDL_HideWindow(window: ?*WindowType) bool;
extern fn SDL_RaiseWindow(window: ?*WindowType) bool;
extern fn SDL_MaximizeWindow(window: ?*WindowType) bool;
extern fn SDL_MinimizeWindow(window: ?*WindowType) bool;
extern fn SDL_RestoreWindow(window: ?*WindowType) bool;
extern fn SDL_SetWindowFullscreen(window: ?*WindowType, fullscreen: bool) bool;
extern fn SDL_WindowHasSurface(window: ?*WindowType) bool;
extern fn SDL_GetWindowSurface(window: ?*WindowType) ?*Surface;
extern fn SDL_UpdateWindowSurface(window: ?*WindowType) bool;
extern fn SDL_UpdateWindowSurfaceRects(window: ?*WindowType, rects: ?[*]const Rect, numrects: c_int) bool;
extern fn SDL_DestroyWindowSurface(window: ?*WindowType) bool;
extern fn SDL_SetWindowKeyboardGrab(window: ?*WindowType, grabbed: bool) bool;
extern fn SDL_SetWindowMouseGrab(window: ?*WindowType, grabbed: bool) bool;
extern fn SDL_GetWindowKeyboardGrab(window: ?*WindowType) bool;
extern fn SDL_GetWindowMouseGrab(window: ?*WindowType) bool;
extern fn SDL_SetWindowMouseRect(window: ?*WindowType, rect: ?*const Rect) bool;
extern fn SDL_GetWindowMouseRect(window: ?*WindowType) ?*const Rect;
extern fn SDL_SetWindowOpacity(window: ?*WindowType, opacity: f32) bool;
extern fn SDL_GetWindowOpacity(window: ?*WindowType) f32;
extern fn SDL_SetWindowFocusable(window: ?*WindowType, focusable: bool) bool;
extern fn SDL_ShowWindowSystemMenu(window: ?*WindowType, x: c_int, y: c_int) bool;
extern fn SDL_SetWindowHitTest(window: ?*WindowType, callback: HitTestCallback, callback_data: ?*anyopaque) bool;
extern fn SDL_SetWindowShape(window: ?*WindowType, shape: ?*Surface) bool;
extern fn SDL_SetWindowModal(window: ?*WindowType, modal: bool) bool;
extern fn SDL_SetWindowProgressState(window: ?*WindowType, state: ProgressState) bool;
extern fn SDL_GetWindowProgressState(window: ?*WindowType) ProgressState;
extern fn SDL_SetWindowProgressValue(window: ?*WindowType, value: f32) bool;
extern fn SDL_GetWindowProgressValue(window: ?*WindowType) f32;
extern fn SDL_FlashWindow(window: ?*WindowType, operation: FlashOperation) bool;
extern fn SDL_DisableScreenSaver() bool;
extern fn SDL_EnableScreenSaver() bool;
extern fn SDL_ScreenSaverEnabled() bool;

// Import types from pixels
const Point = pixels.Point;
const FPoint = pixels.FPoint;
const Rect = pixels.Rect;

const FRect = extern struct {
    x: f32,
    y: f32,
    w: f32,
    h: f32,
};

const surface = @import("surface.zig");
const Surface = surface.Surface;

pub const HitTestResult = enum(c_int) {
    NORMAL,
    DRAGGABLE,
    RESIZE_TOPLEFT,
    RESIZE_TOP,
    RESIZE_TOPRIGHT,
    RESIZE_RIGHT,
    RESIZE_BOTTOMRIGHT,
    RESIZE_BOTTOM,
    RESIZE_BOTTOMLEFT,
    RESIZE_LEFT,
};

pub const HitTestCallback = ?*const fn (?*WindowType, ?*const Point, ?*anyopaque) callconv(.c) HitTestResult;

// Public video API
pub const getNumDrivers = SDL_GetNumVideoDrivers;
pub const getDriver = SDL_GetVideoDriver;
pub const getCurrentDriver = SDL_GetCurrentVideoDriver;
pub const getSystemTheme = SDL_GetSystemTheme;
pub const getDisplays = SDL_GetDisplays;
pub const getPrimaryDisplay = SDL_GetPrimaryDisplay;
pub const getDisplayProps = SDL_GetDisplayProperties;
pub const getDisplayName = SDL_GetDisplayName;
pub const getDisplayBounds = SDL_GetDisplayBounds;
pub const getDisplayUsableBounds = SDL_GetDisplayUsableBounds;
pub const getNaturalDisplayOrientation = SDL_GetNaturalDisplayOrientation;
pub const getCurrentDisplayOrientation = SDL_GetCurrentDisplayOrientation;
pub const getDisplayContentScale = SDL_GetDisplayContentScale;
pub const getDesktopDisplayMode = SDL_GetDesktopDisplayMode;
pub const getCurrentDisplayMode = SDL_GetCurrentDisplayMode;
pub const getFullscreenDisplayModes = SDL_GetFullscreenDisplayModes;
pub const getClosestFullscreenDisplayMode = SDL_GetClosestFullscreenDisplayMode;
pub const getDisplayForPoint = SDL_GetDisplayForPoint;
pub const getDisplayForRect = SDL_GetDisplayForRect;
pub const getDisplayForWindow = SDL_GetDisplayForWindow;
pub const getWindowPixelDensity = SDL_GetWindowPixelDensity;
pub const getWindowDisplayScale = SDL_GetWindowDisplayScale;
pub const setWindowFullscreenMode = SDL_SetWindowFullscreenMode;
pub const getWindowFullscreenMode = SDL_GetWindowFullscreenMode;
pub const getWindowPixelFormat = SDL_GetWindowPixelFormat;
pub const getWindows = SDL_GetWindows;
pub const createWindow = SDL_CreateWindow;
pub const destroyWindow = SDL_DestroyWindow;
pub const getWindowID = SDL_GetWindowID;
pub const getWindowFromID = SDL_GetWindowFromID;
pub const getWindowParent = SDL_GetWindowParent;
pub const getWindowProps = SDL_GetWindowProperties;
pub const getWindowFlags = SDL_GetWindowFlags;
pub const setWindowTitle = SDL_SetWindowTitle;
pub const getWindowTitle = SDL_GetWindowTitle;
pub const setWindowIcon = SDL_SetWindowIcon;
pub const setWindowPosition = SDL_SetWindowPosition;
pub const getWindowPosition = SDL_GetWindowPosition;
pub const setWindowSize = SDL_SetWindowSize;
pub const getWindowSize = SDL_GetWindowSize;
pub const getWindowBordersSize = SDL_GetWindowBordersSize;
pub const getWindowSizeInPixels = SDL_GetWindowSizeInPixels;
pub const setWindowMinimumSize = SDL_SetWindowMinimumSize;
pub const getWindowMinimumSize = SDL_GetWindowMinimumSize;
pub const setWindowMaximumSize = SDL_SetWindowMaximumSize;
pub const getWindowMaximumSize = SDL_GetWindowMaximumSize;
pub const setWindowBordered = SDL_SetWindowBordered;
pub const setWindowResizable = SDL_SetWindowResizable;
pub const setWindowAlwaysOnTop = SDL_SetWindowAlwaysOnTop;
pub const showWindow = SDL_ShowWindow;
pub const hideWindow = SDL_HideWindow;
pub const raiseWindow = SDL_RaiseWindow;
pub const maximizeWindow = SDL_MaximizeWindow;
pub const minimizeWindow = SDL_MinimizeWindow;
pub const restoreWindow = SDL_RestoreWindow;
pub const setWindowFullscreen = SDL_SetWindowFullscreen;
pub const hasWindowSurface = SDL_WindowHasSurface;
pub const getWindowSurface = SDL_GetWindowSurface;
pub const updateWindowSurface = SDL_UpdateWindowSurface;
pub const updateWindowSurfaceRects = SDL_UpdateWindowSurfaceRects;
pub const destroyWindowSurface = SDL_DestroyWindowSurface;
pub const setWindowKeyboardGrab = SDL_SetWindowKeyboardGrab;
pub const setWindowMouseGrab = SDL_SetWindowMouseGrab;
pub const getWindowKeyboardGrab = SDL_GetWindowKeyboardGrab;
pub const getWindowMouseGrab = SDL_GetWindowMouseGrab;
pub const setWindowMouseRect = SDL_SetWindowMouseRect;
pub const getWindowMouseRect = SDL_GetWindowMouseRect;
pub const setWindowOpacity = SDL_SetWindowOpacity;
pub const getWindowOpacity = SDL_GetWindowOpacity;
pub const setWindowFocusable = SDL_SetWindowFocusable;
pub const showWindowSystemMenu = SDL_ShowWindowSystemMenu;
pub const setWindowHitTest = SDL_SetWindowHitTest;
pub const setWindowShape = SDL_SetWindowShape;
pub const setWindowModal = SDL_SetWindowModal;
pub const setWindowProgressState = SDL_SetWindowProgressState;
pub const getWindowProgressState = SDL_GetWindowProgressState;
pub const setWindowProgressValue = SDL_SetWindowProgressValue;
pub const getWindowProgressValue = SDL_GetWindowProgressValue;
pub const flashWindow = SDL_FlashWindow;
pub const disableScreenSaver = SDL_DisableScreenSaver;
pub const enableScreenSaver = SDL_EnableScreenSaver;
pub const isScreenSaverEnabled = SDL_ScreenSaverEnabled;
