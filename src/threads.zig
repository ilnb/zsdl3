// SDL3 Threads Bindings
// Multithreading support

const atomic = @import("atomic.zig");
pub const SDL_TLSID = atomic.AtomicInt;
pub const ID = u64;
const props = @import("props.zig");

// Import types
// Thread structs
pub const Thread = opaque {};
pub const Mutex = opaque {};
pub const Condition = opaque {};
pub const Semaphore = opaque {};

pub const Priority = enum(c_int) {
    LOW,
    NORMAL,
    HIGH,
    TIME_CRITICAL,
};

pub const State = enum(c_int) {
    UNKNOWN,
    ALIVE,
    DETACHED,
    COMPLETE,
};

pub const TLSDestructorCallback = ?*const fn (?*anyopaque) callconv(.c) void;

// Thread functions
extern fn SDL_CreateThread(func: ?*const fn (?*anyopaque) callconv(.c) c_int, name: ?[*:0]const u8, data: ?*anyopaque) ?*Thread;
extern fn SDL_CreateThreadWithProperties(props: props.ID) ?*Thread;
extern fn SDL_WaitThread(thread: ?*Thread, status: ?*c_int) void;
extern fn SDL_CreateMutex() ?*Mutex;
extern fn SDL_DestroyMutex(mutex: ?*Mutex) void;
extern fn SDL_LockMutex(mutex: ?*Mutex) bool;
extern fn SDL_UnlockMutex(mutex: ?*Mutex) bool;
extern fn SDL_TryLockMutex(mutex: ?*Mutex) bool;
extern fn SDL_CreateCondition() ?*Condition;
extern fn SDL_DestroyCondition(cond: ?*Condition) void;
extern fn SDL_SignalCondition(cond: ?*Condition) bool;
extern fn SDL_BroadcastCondition(cond: ?*Condition) bool;
extern fn SDL_WaitCondition(cond: ?*Condition, mutex: ?*Mutex) bool;
extern fn SDL_WaitConditionTimeout(cond: ?*Condition, mutex: ?*Mutex, ms: u32) bool;
extern fn SDL_CreateSemaphore(initial_value: u32) ?*Semaphore;
extern fn SDL_DestroySemaphore(sem: ?*Semaphore) void;
extern fn SDL_SemWait(sem: ?*Semaphore) bool;
extern fn SDL_SemTryWait(sem: ?*Semaphore) bool;
extern fn SDL_SemWaitTimeout(sem: ?*Semaphore, ms: i32) bool;
extern fn SDL_SemPost(sem: ?*Semaphore) bool;
extern fn SDL_SemValue(sem: ?*Semaphore) u32;
extern fn SDL_GetThreadName(thread: ?*Thread) ?[*:0]const u8;
extern fn SDL_SetCurrentThreadPriority(priority: Priority) bool;
extern fn SDL_GetCurrentThreadPriority() Priority;
extern fn SDL_GetCurrentThreadID() ID;
extern fn SDL_DetachThread(thread: ?*Thread) void;
extern fn SDL_GetThreadID(thread: ?*Thread) ID;
extern fn SDL_GetThreadState(thread: ?*Thread) State;
extern fn SDL_GetTLS(id: ?*SDL_TLSID) ?*anyopaque;
extern fn SDL_SetTLS(id: ?*SDL_TLSID, value: ?*const anyopaque, destructor: TLSDestructorCallback) bool;
extern fn SDL_CleanupTLS() void;

// Public API
pub const create = SDL_CreateThread;
pub const wait = SDL_WaitThread;
pub const createMutex = SDL_CreateMutex;
pub const destroyMutex = SDL_DestroyMutex;
pub const lockMutex = SDL_LockMutex;
pub const unlockMutex = SDL_UnlockMutex;
pub const tryLockMutex = SDL_TryLockMutex;
pub const createCondition = SDL_CreateCondition;
pub const destroyCondition = SDL_DestroyCondition;
pub const signalCondition = SDL_SignalCondition;
pub const broadcastCondition = SDL_BroadcastCondition;
pub const waitCondition = SDL_WaitCondition;
pub const waitConditionTimeout = SDL_WaitConditionTimeout;
pub const createSemaphore = SDL_CreateSemaphore;
pub const destroySemaphore = SDL_DestroySemaphore;
pub const semWait = SDL_SemWait;
pub const semTryWait = SDL_SemTryWait;
pub const semWaitTimeout = SDL_SemWaitTimeout;
pub const semPost = SDL_SemPost;
pub const semValue = SDL_SemValue;
pub const getName = SDL_GetThreadName;
pub const setCurrentPriority = SDL_SetCurrentThreadPriority;
pub const getCurrentPriority = SDL_GetCurrentThreadPriority;
pub const getCurrentID = SDL_GetCurrentThreadID;
pub const detach = SDL_DetachThread;
pub const getID = SDL_GetThreadID;
pub const getState = SDL_GetThreadState;
pub const getTLS = SDL_GetTLS;
pub const setTLS = SDL_SetTLS;
pub const cleanupTLS = SDL_CleanupTLS;
pub const createThreadWithProps = SDL_CreateThreadWithProperties;
