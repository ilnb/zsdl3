// SDL3 Misc Bindings
// Utility functions

// Misc functions
extern fn SDL_OpenURL(url: [*:0]const u8) bool;
extern fn SDL_CRC16(crc: u16, data: ?*const anyopaque, len: usize) u16;
extern fn SDL_CRC32(crc: u32, data: ?*const anyopaque, len: usize) u32;
extern fn SDL_murmur3_32(data: ?*const anyopaque, len: usize, seed: u32) u32;
extern fn SDL_GetNumAllocations() c_int;
extern fn SDL_GetFullPath(path: [*:0]const u8) ?[*:0]const u8;

// Public API
pub const openURL = SDL_OpenURL;
pub const crc16 = SDL_CRC16;
pub const crc32 = SDL_CRC32;
pub const murmur3_32 = SDL_murmur3_32;
pub const getNumAllocations = SDL_GetNumAllocations;
pub const getFullPath = SDL_GetFullPath;
