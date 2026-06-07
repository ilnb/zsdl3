// SDL3 Endian Bindings
// Byte order conversion

pub inline fn swapFloat32(x: f32) f32 {
    const swapped: u32 = @byteSwap(@as(u32, @bitCast(x)));
    return @as(f32, @bitCast(swapped));
}

pub inline fn swapFloat64(x: f64) f64 {
    const swapped: u64 = @byteSwap(@as(u64, @bitCast(x)));
    return @as(f64, @bitCast(swapped));
}

// Conditional swaps (swap if host endian differs)
pub inline fn swapLE16(x: u16) u16 {
    return if (BYTEORDER == LIL) x else @byteSwap(x);
}

pub inline fn swapLE32(x: u32) u32 {
    return if (BYTEORDER == LIL) x else @byteSwap(x);
}

pub inline fn swapLE64(x: u64) u64 {
    return if (BYTEORDER == LIL) x else @byteSwap(x);
}

pub inline fn swapBE16(x: u16) u16 {
    return if (BYTEORDER == BIG) x else @byteSwap(x);
}

pub inline fn swapBE32(x: u32) u32 {
    return if (BYTEORDER == BIG) x else @byteSwap(x);
}

pub inline fn swapBE64(x: u64) u64 {
    return if (BYTEORDER == BIG) x else @byteSwap(x);
}

pub inline fn swapFloatLE32(x: f32) f32 {
    return if (BYTEORDER == LIL) x else @byteSwap(x);
}

pub inline fn swapFloatLE64(x: f64) f64 {
    return if (BYTEORDER == LIL) x else @byteSwap(x);
}

pub inline fn swapFloatBE32(x: f32) f32 {
    return if (BYTEORDER == BIG) x else @byteSwap(x);
}

pub inline fn swapFloatBE64(x: f64) f64 {
    return if (BYTEORDER == BIG) x else @byteSwap(x);
}

// Endian detection
pub const BYTEORDER = if (@import("builtin").target.cpu.arch.endian() == .little) 1234 else 4321;
pub const LIL = 1234;
pub const BIG = 4321;
