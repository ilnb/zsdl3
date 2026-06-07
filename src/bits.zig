// SDL3 Bits Bindings
// Bit manipulation utilities

// Bits functions
extern fn SDL_MostSignificantBitIndex32(x: u32) c_int;
extern fn SDL_HasExactlyOneBitSet32(x: u32) bool;

// Public API
pub const mostSignificantBitIndex32 = SDL_MostSignificantBitIndex32;
pub const hasExactlyOneBitSet32 = SDL_HasExactlyOneBitSet32;
