// SDL3 Log Bindings
// Logging system

// Log priority
pub const Priority = enum(c_int) {
    VERBOSE = 1,
    DEBUG,
    INFO,
    WARN,
    ERROR,
    CRITICAL,
    NUM_LOG_PRIORITIES,
};

// Log category
pub const Category = enum(c_int) {
    APPLICATION,
    ERROR,
    ASSERT,
    SYSTEM,
    AUDIO,
    VIDEO,
    RENDER,
    INPUT,
    TEST,
    GPU,
    RESERVED1,
    RESERVED2,
    RESERVED3,
    RESERVED4,
    RESERVED5,
    RESERVED6,
    RESERVED7,
    RESERVED8,
    RESERVED9,
    RESERVED10,
    CUSTOM,
};

// Log functions
extern fn SDL_SetLogPriorities(priority: Priority) void;
extern fn SDL_SetLogPriority(category: c_int, priority: Priority) void;
extern fn SDL_GetLogPriority(category: c_int) Priority;
extern fn SDL_ResetLogPriorities() void;
extern fn SDL_Log(fmt: [*:0]const u8, ...) void;
extern fn SDL_LogVerbose(category: c_int, fmt: [*:0]const u8, ...) void;
extern fn SDL_LogDebug(category: c_int, fmt: [*:0]const u8, ...) void;
extern fn SDL_LogInfo(category: c_int, fmt: [*:0]const u8, ...) void;
extern fn SDL_LogWarn(category: c_int, fmt: [*:0]const u8, ...) void;
extern fn SDL_LogError(category: c_int, fmt: [*:0]const u8, ...) void;
extern fn SDL_LogCritical(category: c_int, fmt: [*:0]const u8, ...) void;
extern fn SDL_LogMessage(category: c_int, priority: Priority, fmt: [*:0]const u8, ...) void;
extern fn SDL_GetDefaultLogOutputFunction() ?*const fn (?*anyopaque, c_int, Priority, [*:0]const u8) callconv(.c) void;
extern fn SDL_SetLogOutputFunction(callback: ?*const fn (?*anyopaque, c_int, Priority, [*:0]const u8) callconv(.c) void, userdata: ?*anyopaque) void;
extern fn SDL_GetLogOutputFunction(callback: ?*?*const fn (?*anyopaque, c_int, Priority, [*:0]const u8) callconv(.c) void, userdata: ?*?*anyopaque) void;
extern fn SDL_SetLogPriorityPrefix(priority: Priority, prefix: [*:0]const u8) bool;

// Public API
pub const setLogPriorities = SDL_SetLogPriorities;
pub const setLogPriority = SDL_SetLogPriority;
pub const getLogPriority = SDL_GetLogPriority;
pub const resetLogPriorities = SDL_ResetLogPriorities;
pub const log = SDL_Log;
pub const logVerbose = SDL_LogVerbose;
pub const logDebug = SDL_LogDebug;
pub const logInfo = SDL_LogInfo;
pub const logWarn = SDL_LogWarn;
pub const logError = SDL_LogError;
pub const logCritical = SDL_LogCritical;
pub const logMessage = SDL_LogMessage;
pub const getDefaultLogOutputFunction = SDL_GetDefaultLogOutputFunction;
pub const setLogOutputFunction = SDL_SetLogOutputFunction;
pub const getLogOutputFunction = SDL_GetLogOutputFunction;
pub const setLogPriorityPrefix = SDL_SetLogPriorityPrefix;
