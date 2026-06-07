// SDL3 Process Bindings
// External process spawning and management

const fs = @import("fs.zig");
const props = @import("props.zig");

// Process handle
pub const Process = opaque {};

// Process IO stream
pub const IO = enum(c_int) {
    INHERITED,
    NULL,
    APP,
    REDIRECT,
};

// Process functions
extern fn SDL_CreateProcess(args: ?[*]const ?[*:0]const u8, pipe_stdio: bool) ?*Process;
extern fn SDL_GetProcessInput(process: ?*Process) ?*fs.IOStream;
extern fn SDL_GetProcessOutput(process: ?*Process) ?*fs.IOStream;
extern fn SDL_WaitProcess(process: ?*Process, block: bool, exitcode: ?*c_int) bool;
extern fn SDL_KillProcess(process: ?*Process, force: bool) bool;
extern fn SDL_DestroyProcess(process: ?*Process) void;
extern fn SDL_CreateProcessWithProperties(props: props.ID) ?*Process;
extern fn SDL_GetProcessProperties(process: ?*Process) props.ID;
extern fn SDL_ReadProcess(process: ?*Process, datasize: ?*usize, exitcode: ?*c_int) ?*anyopaque;

// Public API
pub const create = SDL_CreateProcess;
pub const getInput = SDL_GetProcessInput;
pub const getOutput = SDL_GetProcessOutput;
pub const wait = SDL_WaitProcess;
pub const kill = SDL_KillProcess;
pub const destroy = SDL_DestroyProcess;
pub const createWithProps = SDL_CreateProcessWithProperties;
pub const getProps = SDL_GetProcessProperties;
pub const read = SDL_ReadProcess;
