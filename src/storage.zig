// SDL3 Storage Bindings
// User/title storage

const props = @import("props.zig");
const PropID = props.ID;

const EnumerationResult = fs.EnumerationResult;
const GlobFlags = fs.GlobFlags;
const fs = @import("fs.zig");
const PathInfo = fs.PathInfo;

// Storage structs
pub const Storage = opaque {};

// Storage functions
extern fn SDL_OpenTitleStorage(override: ?[*:0]const u8, props: PropID) ?*Storage;
extern fn SDL_OpenUserStorage(root: ?[*:0]const u8, name: ?[*:0]const u8, props: PropID) ?*Storage;
extern fn SDL_OpenFileStorage(path: ?[*:0]const u8) ?*Storage;
extern fn SDL_CloseStorage(storage: ?*Storage) bool;
extern fn SDL_StorageReady(storage: ?*Storage) bool;
extern fn SDL_GetStorageFileSize(storage: ?*Storage, path: ?[*:0]const u8, length: ?*u64) bool;
extern fn SDL_ReadStorageFile(storage: ?*Storage, path: ?[*:0]const u8, destination: ?*anyopaque, length: u64) bool;
extern fn SDL_WriteStorageFile(storage: ?*Storage, path: ?[*:0]const u8, source: ?*const anyopaque, length: u64) bool;
extern fn SDL_CreateStorageDirectory(storage: ?*Storage, path: ?[*:0]const u8) bool;
extern fn SDL_EnumerateStorageDirectory(storage: ?*Storage, path: ?[*:0]const u8, callback: ?*const fn (?*anyopaque, ?[*:0]const u8, ?[*:0]const u8, EnumerationResult) callconv(.c) bool, userdata: ?*anyopaque) bool;
extern fn SDL_RemoveStoragePath(storage: ?*Storage, path: ?[*:0]const u8) bool;
extern fn SDL_GlobStorageDirectory(storage: ?*Storage, path: ?[*:0]const u8, pattern: ?[*:0]const u8, flags: GlobFlags, count: ?*c_int) ?[*]?[*:0]u8;
extern fn SDL_GetStoragePathInfo(storage: ?*Storage, path: ?[*:0]const u8, info: ?*PathInfo) bool;

// Public API
pub const openTitleStorage = SDL_OpenTitleStorage;
pub const openUserStorage = SDL_OpenUserStorage;
pub const openFileStorage = SDL_OpenFileStorage;
pub const closeStorage = SDL_CloseStorage;
pub const storageReady = SDL_StorageReady;
pub const getStorageFileSize = SDL_GetStorageFileSize;
pub const readStorageFile = SDL_ReadStorageFile;
pub const writeStorageFile = SDL_WriteStorageFile;
pub const createStorageDirectory = SDL_CreateStorageDirectory;
pub const enumerateStorageDirectory = SDL_EnumerateStorageDirectory;
pub const removeStoragePath = SDL_RemoveStoragePath;
pub const globStorageDirectory = SDL_GlobStorageDirectory;
pub const getStoragePathInfo = SDL_GetStoragePathInfo;
