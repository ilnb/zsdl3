// SDL3 Atomic Bindings
// Lock-free atomic operations

// Atomic types
pub const SpinLock = c_int;
pub const AtomicInt = extern struct {
    value: c_int,
};

// Atomic functions
extern fn SDL_TryLockSpinlock(lock: ?*SpinLock) bool;
extern fn SDL_LockSpinlock(lock: ?*SpinLock) void;
extern fn SDL_UnlockSpinlock(lock: ?*SpinLock) void;
extern fn SDL_AtomicIncRef(atomic: ?*anyopaque) c_int;
extern fn SDL_AtomicDecRef(atomic: ?*anyopaque) c_int;
extern fn SDL_MemoryBarrierReleaseFunction() void;
extern fn SDL_MemoryBarrierAcquireFunction() void;

// Public API
pub const tryLockSpinlock = SDL_TryLockSpinlock;
pub const lockSpinlock = SDL_LockSpinlock;
pub const unlockSpinlock = SDL_UnlockSpinlock;
pub const atomicIncRef = SDL_AtomicIncRef;
pub const atomicDecRef = SDL_AtomicDecRef;
pub const memoryBarrierReleaseFunction = SDL_MemoryBarrierReleaseFunction;
pub const memoryBarrierAcquireFunction = SDL_MemoryBarrierAcquireFunction;
