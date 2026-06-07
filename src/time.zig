// SDL3 Time Bindings
// Timers, delays, timing functions

const core = @import("core.zig");
pub const Time = core.Time;

// Import types
// Timer callback
pub const TimerCallback = ?*const fn (?*anyopaque, TimerID, u32) callconv(.c) u32;
pub const TimerID = u32;

pub const Date = extern struct {
    year: c_int,
    month: c_int,
    day: c_int,
    hour: c_int,
    minute: c_int,
    second: c_int,
    nanosecond: c_int,
    day_of_week: c_int,
    utc_offset: c_int,
};

pub const DateFormat = enum(c_int) {
    YYYYMMDD,
    DDMMYYYY,
    MMDDYYYY,
};

pub const TimeFormat = enum(c_int) {
    FMT_24HR,
    FMT_12HR,
};

// Time functions
extern fn SDL_GetTicks() u64;
extern fn SDL_GetTicksNS() u64;
extern fn SDL_Delay(ms: u32) void;
extern fn SDL_AddTimer(interval: u32, callback: TimerCallback, param: ?*anyopaque) TimerID;
extern fn SDL_RemoveTimer(id: TimerID) bool;
extern fn SDL_GetPerformanceCounter() u64;
extern fn SDL_GetPerformanceFrequency() u64;
extern fn SDL_GetCurrentTime(ticks: ?*Time) bool;
extern fn SDL_TimeToDateTime(ticks: Time, dt: ?*Date, localTime: bool) bool;
extern fn SDL_DateTimeToTime(dt: ?*const Date, ticks: ?*core.Time) bool;
extern fn SDL_GetDateTimeLocalePreferences(dateFormat: ?*DateFormat, timeFormat: ?*TimeFormat) bool;
extern fn SDL_TimeToWindows(ticks: core.Time, dwLowDateTime: ?*u32, dwHighDateTime: ?*u32) void;
extern fn SDL_TimeFromWindows(dwLowDateTime: u32, dwHighDateTime: u32) core.Time;
extern fn SDL_GetDaysInMonth(year: c_int, month: c_int) c_int;
extern fn SDL_GetDayOfYear(year: c_int, month: c_int, day: c_int) c_int;
extern fn SDL_GetDayOfWeek(year: c_int, month: c_int, day: c_int) c_int;

// Public API
pub const getTicks = SDL_GetTicks;
pub const getTicksNS = SDL_GetTicksNS;
pub const delay = SDL_Delay;
pub const addTimer = SDL_AddTimer;
pub const removeTimer = SDL_RemoveTimer;
pub const getPerformanceCounter = SDL_GetPerformanceCounter;
pub const getPerformanceFrequency = SDL_GetPerformanceFrequency;
pub const getCurrent = SDL_GetCurrentTime;
pub const toDate = SDL_TimeToDateTime;
pub const fromDate = SDL_DateTimeToTime;
pub const getDateLocalePreferences = SDL_GetDateTimeLocalePreferences;
pub const toWindows = SDL_TimeToWindows;
pub const fromWindows = SDL_TimeFromWindows;
pub const getDaysInMonth = SDL_GetDaysInMonth;
pub const getDayOfYear = SDL_GetDayOfYear;
pub const getDayOfWeek = SDL_GetDayOfWeek;
