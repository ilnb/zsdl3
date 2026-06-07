// SDL3 AsyncIO Bindings
// Asynchronous file I/O

// AsyncIO handle
pub const AsyncIO = opaque {};

// AsyncIO queue
pub const Queue = opaque {};

// AsyncIO task type
pub const TaskType = enum(c_int) {
    READ,
    WRITE,
    CLOSE,
};

// AsyncIO result
pub const Result = enum(c_int) {
    COMPLETE,
    FAILURE,
    CANCELED,
};

// AsyncIO outcome
pub const Outcome = extern struct {
    asyncio: ?*AsyncIO,
    type_: TaskType,
    result: Result,
    buffer: ?*anyopaque,
    offset: u64,
    bytes_requested: u64,
    bytes_transferred: u64,
    userdata: ?*anyopaque,
};

// AsyncIO functions
extern fn SDL_AsyncIOFromFile(file: ?[*:0]const u8, mode: ?[*:0]const u8) ?*AsyncIO;
extern fn SDL_GetAsyncIOSize(asyncio: ?*AsyncIO) i64;
extern fn SDL_ReadAsyncIO(asyncio: ?*AsyncIO, ptr: ?*anyopaque, offset: u64, size: u64, queue: ?*Queue, userdata: ?*anyopaque) bool;
extern fn SDL_WriteAsyncIO(asyncio: ?*AsyncIO, ptr: ?*const anyopaque, offset: u64, size: u64, queue: ?*Queue, userdata: ?*anyopaque) bool;
extern fn SDL_CloseAsyncIO(asyncio: ?*AsyncIO, flush: bool, queue: ?*Queue, userdata: ?*anyopaque) bool;
extern fn SDL_CreateAsyncIOQueue() ?*Queue;
extern fn SDL_DestroyAsyncIOQueue(queue: ?*Queue) void;
extern fn SDL_GetAsyncIOResult(queue: ?*Queue, outcome: ?*Outcome) bool;
extern fn SDL_WaitAsyncIOResult(queue: ?*Queue, outcome: ?*Outcome, timeoutMS: i32) bool;

// Public API
pub const asyncIOFromFile = SDL_AsyncIOFromFile;
pub const getAsyncIOSize = SDL_GetAsyncIOSize;
pub const readAsyncIO = SDL_ReadAsyncIO;
pub const writeAsyncIO = SDL_WriteAsyncIO;
pub const closeAsyncIO = SDL_CloseAsyncIO;
pub const createAsyncIOQueue = SDL_CreateAsyncIOQueue;
pub const destroyAsyncIOQueue = SDL_DestroyAsyncIOQueue;
pub const getAsyncIOResult = SDL_GetAsyncIOResult;
pub const waitAsyncIOResult = SDL_WaitAsyncIOResult;
