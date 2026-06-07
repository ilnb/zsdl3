// SDL3 Filesystem Bindings
// File I/O abstractions

const core = @import("core.zig");
const props = @import("props.zig");
pub const GlobFlags = c_uint;

// Import types
// Filesystem structs
pub const IOStream = opaque {};

// Filesystem path types and enums
pub const Folder = enum(c_int) {
    HOME,
    DESKTOP,
    DOCUMENTS,
    DOWNLOADS,
    MUSIC,
    PICTURES,
    PUBLICSHARE,
    SAVEDGAMES,
    SCREENSHOTS,
    TEMPLATES,
    VIDEOS,
    COUNT,
};

pub const PathType = enum(c_int) {
    NONE,
    FILE,
    DIRECTORY,
    OTHER,
};

pub const PathInfo = extern struct {
    type: PathType,
    size: u64,
    create_time: core.Time, // SDL_Time is i64
    modify_time: core.Time, // SDL_Time is i64
    access_time: core.Time, // SDL_Time is i64
};

pub const GLOB_CASEINSENSITIVE: GlobFlags = 1 << 0;

pub const EnumerationResult = enum(c_int) {
    CONTINUE,
    SUCCESS,
    FAILURE,
};

pub const EnumerateDirectoryCallback = ?*const fn (?*anyopaque, [*:0]const u8, [*:0]const u8) callconv(.c) EnumerationResult;

// Async I/O
const asyncio = @import("asyncio.zig");
const AsyncIO = asyncio.AsyncIO;
const AsyncIOOutcome = asyncio.Outcome;
const AsyncIOTaskType = asyncio.TaskType;
const AsyncIOResult = asyncio.Result;
const AsyncIOQueue = asyncio.Queue;

// Filesystem path functions
extern fn SDL_GetBasePath() ?[*:0]const u8;
extern fn SDL_GetPrefPath(org: ?[*:0]const u8, app: [*:0]const u8) ?[*:0]u8;
extern fn SDL_GetUserFolder(folder: Folder) ?[*:0]const u8;
extern fn SDL_GetCurrentDirectory() ?[*:0]u8;
extern fn SDL_CreateDirectory(path: [*:0]const u8) bool;
extern fn SDL_RemovePath(path: [*:0]const u8) bool;
extern fn SDL_RenamePath(oldpath: [*:0]const u8, newpath: [*:0]const u8) bool;
extern fn SDL_CopyFile(oldpath: [*:0]const u8, newpath: [*:0]const u8) bool;
extern fn SDL_GetPathInfo(path: [*:0]const u8, info: ?*PathInfo) bool;
extern fn SDL_EnumerateDirectory(path: [*:0]const u8, callback: EnumerateDirectoryCallback, userdata: ?*anyopaque) bool;
extern fn SDL_GlobDirectory(path: [*:0]const u8, pattern: ?[*:0]const u8, flags: GlobFlags, count: ?*c_int) ?[*]?[*:0]u8;

// Filesystem I/O functions
extern fn SDL_IOFromFile(file: ?[*:0]const u8, mode: ?[*:0]const u8) ?*IOStream;
extern fn SDL_CloseIO(stream: ?*IOStream) bool;
extern fn SDL_ReadIO(stream: ?*IOStream, ptr: ?*anyopaque, size: usize) usize;
extern fn SDL_WriteIO(stream: ?*IOStream, ptr: ?*const anyopaque, size: usize) usize;
extern fn SDL_SeekIO(stream: ?*IOStream, offset: i64, whence: c_int) i64;
extern fn SDL_TellIO(stream: ?*IOStream) i64;
extern fn SDL_GetIOSize(stream: ?*IOStream) i64;
extern fn SDL_FlushIO(stream: ?*IOStream) bool;
extern fn SDL_LoadFile(file: ?[*:0]const u8, datasize: ?*usize) ?*anyopaque;
extern fn SDL_SaveFile(file: ?[*:0]const u8, data: ?*const anyopaque, datasize: usize) bool;
extern fn SDL_ReadU8(stream: ?*IOStream, value: ?*u8) bool;
extern fn SDL_ReadS8(stream: ?*IOStream, value: ?*i8) bool;
extern fn SDL_ReadU16LE(stream: ?*IOStream, value: ?*u16) bool;
extern fn SDL_ReadS16LE(stream: ?*IOStream, value: ?*i16) bool;
extern fn SDL_ReadU16BE(stream: ?*IOStream, value: ?*u16) bool;
extern fn SDL_ReadS16BE(stream: ?*IOStream, value: ?*i16) bool;
extern fn SDL_ReadU32LE(stream: ?*IOStream, value: ?*u32) bool;
extern fn SDL_ReadS32LE(stream: ?*IOStream, value: ?*i32) bool;
extern fn SDL_ReadU32BE(stream: ?*IOStream, value: ?*u32) bool;
extern fn SDL_ReadS32BE(stream: ?*IOStream, value: ?*i32) bool;
extern fn SDL_ReadU64LE(stream: ?*IOStream, value: ?*u64) bool;
extern fn SDL_ReadS64LE(stream: ?*IOStream, value: ?*i64) bool;
extern fn SDL_ReadU64BE(stream: ?*IOStream, value: ?*u64) bool;
extern fn SDL_ReadS64BE(stream: ?*IOStream, value: ?*i64) bool;
extern fn SDL_WriteU8(stream: ?*IOStream, value: u8) bool;
extern fn SDL_WriteS8(stream: ?*IOStream, value: i8) bool;
extern fn SDL_WriteU16LE(stream: ?*IOStream, value: u16) bool;
extern fn SDL_WriteS16LE(stream: ?*IOStream, value: i16) bool;
extern fn SDL_WriteU16BE(stream: ?*IOStream, value: u16) bool;
extern fn SDL_WriteS16BE(stream: ?*IOStream, value: i16) bool;
extern fn SDL_WriteU32LE(stream: ?*IOStream, value: u32) bool;
extern fn SDL_WriteS32LE(stream: ?*IOStream, value: i32) bool;
extern fn SDL_WriteU32BE(stream: ?*IOStream, value: u32) bool;
extern fn SDL_WriteS32BE(stream: ?*IOStream, value: i32) bool;
extern fn SDL_WriteU64LE(stream: ?*IOStream, value: u64) bool;
extern fn SDL_WriteS64LE(stream: ?*IOStream, value: i64) bool;
extern fn SDL_WriteU64BE(stream: ?*IOStream, value: u64) bool;
extern fn SDL_WriteS64BE(stream: ?*IOStream, value: i64) bool;
extern fn SDL_IOFromConstMem(mem: ?*const anyopaque, size: usize) ?*IOStream;
extern fn SDL_IOFromMem(mem: ?*anyopaque, size: usize) ?*IOStream;
extern fn SDL_IOFromDynamicMem() ?*IOStream;
extern fn SDL_GetIOProperties(stream: ?*IOStream) props.ID;
extern fn SDL_GetIOStatus(stream: ?*IOStream) c_int;

// Public API
pub const getBasePath = SDL_GetBasePath;
pub const getPrefPath = SDL_GetPrefPath;
pub const getUserFolder = SDL_GetUserFolder;
pub const getCurrentDirectory = SDL_GetCurrentDirectory;
pub const createDirectory = SDL_CreateDirectory;
pub const removePath = SDL_RemovePath;
pub const renamePath = SDL_RenamePath;
pub const copyFile = SDL_CopyFile;
pub const getPathInfo = SDL_GetPathInfo;
pub const enumerateDirectory = SDL_EnumerateDirectory;
pub const globDirectory = SDL_GlobDirectory;
pub const ioFromFile = SDL_IOFromFile;
pub const closeIO = SDL_CloseIO;
pub const readIO = SDL_ReadIO;
pub const writeIO = SDL_WriteIO;
pub const seekIO = SDL_SeekIO;
pub const tellIO = SDL_TellIO;
pub const getIOSize = SDL_GetIOSize;
pub const flushIO = SDL_FlushIO;
pub const loadFile = SDL_LoadFile;
pub const saveFile = SDL_SaveFile;
pub const readU8 = SDL_ReadU8;
pub const readS8 = SDL_ReadS8;
pub const readU16LE = SDL_ReadU16LE;
pub const readS16LE = SDL_ReadS16LE;
pub const readU16BE = SDL_ReadU16BE;
pub const readS16BE = SDL_ReadS16BE;
pub const readU32LE = SDL_ReadU32LE;
pub const readS32LE = SDL_ReadS32LE;
pub const readU32BE = SDL_ReadU32BE;
pub const readS32BE = SDL_ReadS32BE;
pub const readU64LE = SDL_ReadU64LE;
pub const readS64LE = SDL_ReadS64LE;
pub const readU64BE = SDL_ReadU64BE;
pub const readS64BE = SDL_ReadS64BE;
pub const writeU8 = SDL_WriteU8;
pub const writeS8 = SDL_WriteS8;
pub const writeU16LE = SDL_WriteU16LE;
pub const writeS16LE = SDL_WriteS16LE;
pub const writeU16BE = SDL_WriteU16BE;
pub const writeS16BE = SDL_WriteS16BE;
pub const writeU32LE = SDL_WriteU32LE;
pub const writeS32LE = SDL_WriteS32LE;
pub const writeU32BE = SDL_WriteU32BE;
pub const writeS32BE = SDL_WriteS32BE;
pub const writeU64LE = SDL_WriteU64LE;
pub const writeS64LE = SDL_WriteS64LE;
pub const writeU64BE = SDL_WriteU64BE;
pub const writeS64BE = SDL_WriteS64BE;
pub const ioFromConstMem = SDL_IOFromConstMem;
pub const ioFromMem = SDL_IOFromMem;
pub const ioFromDynamicMem = SDL_IOFromDynamicMem;
pub const getIOProps = SDL_GetIOProperties;
pub const getIOStatus = SDL_GetIOStatus;
