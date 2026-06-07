// SDL3 Assert Bindings
// Custom assertion handling

// Assert state
pub const State = enum(c_int) {
    RETRY,
    BREAK,
    ABORT,
    IGNORE,
    ALWAYS_IGNORE,
};

// Assert data
pub const Data = extern struct {
    always_ignore: bool,
    trigger_count: c_uint,
    condition: ?[*:0]const u8,
    filename: ?[*:0]const u8,
    linenum: c_int,
    fntion: ?[*:0]const u8,
    next: ?*Data,
};

// Assert functions
extern fn SDL_SetAssertionHandler(handler: ?*const fn (?*const Data, ?*anyopaque) callconv(.c) State, userdata: ?*anyopaque) void;
extern fn SDL_GetDefaultAssertionHandler() ?*const fn (?*const Data, ?*anyopaque) callconv(.c) State;
extern fn SDL_GetAssertionHandler(userdata: ?*?*anyopaque) ?*const fn (?*const Data, ?*anyopaque) callconv(.c) State;
extern fn SDL_GetAssertionReport() ?*const Data;
extern fn SDL_ResetAssertionReport() void;
extern fn SDL_TriggerBreakpoint() void;
extern fn SDL_SetAssertionRetry(state: bool) void;
extern fn SDL_GetAssertionRetry() bool;

// Public API
pub const setAssertionHandler = SDL_SetAssertionHandler;
pub const getDefaultAssertionHandler = SDL_GetDefaultAssertionHandler;
pub const getAssertionHandler = SDL_GetAssertionHandler;
pub const getAssertionReport = SDL_GetAssertionReport;
pub const resetAssertionReport = SDL_ResetAssertionReport;
pub const triggerBreakpoint = SDL_TriggerBreakpoint;
pub const setAssertionRetry = SDL_SetAssertionRetry;
pub const getAssertionRetry = SDL_GetAssertionRetry;
