// SDL3 Pixels and Rect Bindings
// Pixel formats, blend modes, rectangles, colors

// Pixel format
pub const Format = c_uint;

// Key pixel formats
pub const PIXELFORMAT_UNKNOWN = 0;
pub const PIXELFORMAT_RGBA8888 = 0x16462004;
pub const PIXELFORMAT_ARGB8888 = 0x16362004;
pub const PIXELFORMAT_ABGR8888 = 0x16762004;
pub const PIXELFORMAT_BGRA8888 = 0x16862004;
pub const PIXELFORMAT_RGB565 = 0x15151002;

// Blend modes
pub const BlendMode = u32;
pub const BLENDMODE_NONE = 0x00000000;
pub const BLENDMODE_BLEND = 0x00000001;
pub const BLENDMODE_BLEND_PREMULTIPLIED = 0x00000010;
pub const BLENDMODE_ADD = 0x00000002;
pub const BLENDMODE_ADD_PREMULTIPLIED = 0x00000020;
pub const BLENDMODE_MOD = 0x00000004;
pub const BLENDMODE_MUL = 0x00000008;
pub const BLENDMODE_INVALID = 0x7FFFFFFF;

pub const BlendOperation = enum(c_int) {
    BLENDOPERATION_ADD = 0x1,
    BLENDOPERATION_SUBTRACT = 0x2,
    BLENDOPERATION_REV_SUBTRACT = 0x3,
    BLENDOPERATION_MINIMUM = 0x4,
    BLENDOPERATION_MAXIMUM = 0x5,
};

pub const BlendFactor = enum(c_int) {
    BLENDFACTOR_ZERO = 0x1,
    BLENDFACTOR_ONE = 0x2,
    BLENDFACTOR_SRC_COLOR = 0x3,
    BLENDFACTOR_ONE_MINUS_SRC_COLOR = 0x4,
    BLENDFACTOR_SRC_ALPHA = 0x5,
    BLENDFACTOR_ONE_MINUS_SRC_ALPHA = 0x6,
    BLENDFACTOR_DST_COLOR = 0x7,
    BLENDFACTOR_ONE_MINUS_DST_COLOR = 0x8,
    BLENDFACTOR_DST_ALPHA = 0x9,
    BLENDFACTOR_ONE_MINUS_DST_ALPHA = 0xA,
};

// Color
pub const Color = extern struct {
    r: u8,
    g: u8,
    b: u8,
    a: u8,
};

// Palette
pub const Palette = extern struct {
    ncolors: c_int,
    colors: ?[*]Color,
    version: u32,
    refcount: c_int,
};

// Point and Rect
pub const Point = extern struct {
    x: c_int,
    y: c_int,
};

pub const FPoint = extern struct {
    x: f32,
    y: f32,
};

pub const Rect = extern struct {
    x: c_int,
    y: c_int,
    w: c_int,
    h: c_int,
};

pub const FRect = extern struct {
    x: f32,
    y: f32,
    w: f32,
    h: f32,
};

// Pixel format details
pub const FormatDetails = extern struct {
    format: Format,
    bits_per_pixel: u8,
    bytes_per_pixel: u8,
    padding: [2]u8,
    Rmask: u32,
    Gmask: u32,
    Bmask: u32,
    Amask: u32,
    Rbits: u8,
    Gbits: u8,
    Bbits: u8,
    Abits: u8,
    Rshift: u8,
    Gshift: u8,
    Bshift: u8,
    Ashift: u8,
};

// Pixel functions
extern fn SDL_GetPixelFormatName(format: Format) ?[*:0]const u8;
extern fn SDL_GetMasksForPixelFormat(format: Format, bpp: ?*c_int, Rmask: ?*u32, Gmask: ?*u32, Bmask: ?*u32, Amask: ?*u32) bool;

// Blend mode fntion
extern fn SDL_ComposeCustomBlendMode(srcColorFactor: BlendFactor, dstColorFactor: BlendFactor, colorOperation: BlendOperation, srcAlphaFactor: BlendFactor, dstAlphaFactor: BlendFactor, alphaOperation: BlendOperation) BlendMode;

// Color mapping functions
extern fn SDL_MapRGB(format: Format, palette: ?*Palette, r: u8, g: u8, b: u8) u32;
extern fn SDL_MapRGBA(format: Format, palette: ?*Palette, r: u8, g: u8, b: u8, a: u8) u32;
extern fn SDL_GetRGB(pixel: u32, format: Format, palette: ?*Palette, r: ?*u8, g: ?*u8, b: ?*u8) void;
extern fn SDL_GetRGBA(pixel: u32, format: Format, palette: ?*Palette, r: ?*u8, g: ?*u8, b: ?*u8, a: ?*u8) void;

// Palette functions
extern fn SDL_AllocPalette(ncolors: c_int) ?*Palette;
extern fn SDL_SetPaletteColors(palette: ?*Palette, colors: ?[*]const Color, firstcolor: c_int, ncolors: c_int) bool;
extern fn SDL_FreePalette(palette: ?*Palette) void;

// Pixel format functions
extern fn SDL_GetPixelFormatForMasks(bpp: c_int, Rmask: u32, Gmask: u32, Bmask: u32, Amask: u32) Format;
extern fn SDL_GetPixelFormatDetails(format: Format) ?*const FormatDetails;
extern fn SDL_CreatePalette(ncolors: c_int) ?*Palette;
extern fn SDL_DestroyPalette(palette: ?*Palette) void;

// Rect functions
extern fn SDL_HasRectIntersection(A: ?*const Rect, B: ?*const Rect) bool;
extern fn SDL_GetRectIntersection(A: ?*const Rect, B: ?*const Rect, result: ?*Rect) bool;
extern fn SDL_GetRectUnion(A: ?*const Rect, B: ?*const Rect, result: ?*Rect) bool;
extern fn SDL_GetRectEnclosingPoints(points: ?[*]const Point, count: c_int, clip: ?*const Rect, result: ?*Rect) bool;
extern fn SDL_GetRectAndLineIntersection(rect: ?*const Rect, X1: ?*c_int, Y1: ?*c_int, X2: ?*c_int, Y2: ?*c_int) bool;
extern fn SDL_HasRectIntersectionFloat(A: ?*const FRect, B: ?*const FRect) bool;
extern fn SDL_GetRectIntersectionFloat(A: ?*const FRect, B: ?*const FRect, result: ?*FRect) bool;
extern fn SDL_GetRectUnionFloat(A: ?*const FRect, B: ?*const FRect, result: ?*FRect) bool;
extern fn SDL_GetRectEnclosingPointsFloat(points: ?[*]const FPoint, count: c_int, clip: ?*const FRect, result: ?*FRect) bool;
extern fn SDL_GetRectAndLineIntersectionFloat(rect: ?*const FRect, X1: ?*f32, Y1: ?*f32, X2: ?*f32, Y2: ?*f32) bool;

// Rect functions (inline in C, implemented in Zig)
pub inline fn SDL_PointInRect(p: ?*const Point, r: ?*const Rect) bool {
    return if (p != null and r != null and p.?.x >= r.?.x and p.?.x < r.?.x + r.?.w and p.?.y >= r.?.y and p.?.y < r.?.y + r.?.h) true else false;
}

pub inline fn SDL_RectEmpty(r: ?*const Rect) bool {
    return (r == null or r.?.w <= 0 or r.?.h <= 0);
}

// Public API
pub const getPixelFormatName = SDL_GetPixelFormatName;
pub const getMasksForPixelFormat = SDL_GetMasksForPixelFormat;
pub const composeCustomBlendMode = SDL_ComposeCustomBlendMode;
pub const mapRGB = SDL_MapRGB;
pub const mapRGBA = SDL_MapRGBA;
pub const getRGB = SDL_GetRGB;
pub const getRGBA = SDL_GetRGBA;
pub const allocPalette = SDL_AllocPalette;
pub const setPaletteColors = SDL_SetPaletteColors;
pub const freePalette = SDL_FreePalette;
pub const getPixelFormatForMasks = SDL_GetPixelFormatForMasks;
pub const getPixelFormatDetails = SDL_GetPixelFormatDetails;
pub const createPalette = SDL_CreatePalette;
pub const destroyPalette = SDL_DestroyPalette;
pub const hasRectIntersection = SDL_HasRectIntersection;
pub const getRectIntersection = SDL_GetRectIntersection;
pub const getRectUnion = SDL_GetRectUnion;
pub const getRectEnclosingPoints = SDL_GetRectEnclosingPoints;
pub const getRectAndLineIntersection = SDL_GetRectAndLineIntersection;
pub const hasRectIntersectionFloat = SDL_HasRectIntersectionFloat;
pub const getRectIntersectionFloat = SDL_GetRectIntersectionFloat;
pub const getRectUnionFloat = SDL_GetRectUnionFloat;
pub const getRectEnclosingPointsFloat = SDL_GetRectEnclosingPointsFloat;
pub const getRectAndLineIntersectionFloat = SDL_GetRectAndLineIntersectionFloat;
pub const rectEmpty = SDL_RectEmpty;
pub const pointInRect = SDL_PointInRect;
