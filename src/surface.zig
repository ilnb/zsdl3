// SDL3 Surface Bindings
// Software surfaces for drawing

const fs = @import("fs.zig");
const pixels = @import("pixels.zig");
const props = @import("props.zig");
const render = @import("render.zig");
const Format = pixels.Format;
const Palette = pixels.Palette;
const Rect = pixels.Rect;
const IOStream = fs.IOStream;

// Flip mode
pub const FlipMode = enum(c_int) {
    NONE = 0,
    HORIZONTAL = 1,
    VERTICAL = 2,
    HORIZONTAL_AND_VERTICAL = 3, // FLIP_HORIZONTAL | FLIP_VERTICAL
};

// Surface flags
pub const Flags = c_uint;

// Surface struct
pub const Surface = extern struct {
    flags: Flags,
    format: Format,
    w: c_int,
    h: c_int,
    pitch: c_int,
    pixels: ?*anyopaque,
    refcount: c_int,
    reserved: ?*anyopaque,
};

// Pixel format details (re-exported from pixels)
const FormatDetails = pixels.FormatDetails;

// Surface functions
extern fn SDL_CreateSurface(width: c_int, height: c_int, format: Format) ?*Surface;
extern fn SDL_CreateSurfaceFrom(width: c_int, height: c_int, format: Format, pixels: ?*anyopaque, pitch: c_int) ?*Surface;
extern fn SDL_DestroySurface(surface: ?*Surface) void;
extern fn SDL_GetSurfaceProperties(surface: ?*Surface) props.ID;
extern fn SDL_SetSurfaceColorspace(surface: ?*Surface, colorspace: render.Colorspace) bool;
extern fn SDL_GetSurfaceColorspace(surface: ?*Surface) c_uint;
extern fn SDL_CreateSurfacePalette(surface: ?*Surface) ?*Palette;
extern fn SDL_SetSurfacePalette(surface: ?*Surface, palette: ?*Palette) bool;
extern fn SDL_GetSurfacePalette(surface: ?*Surface) ?*Palette;
extern fn SDL_AddSurfaceAlternateImage(surface: ?*Surface, image: ?*Surface) bool;
extern fn SDL_SurfaceHasAlternateImages(surface: ?*Surface) bool;
extern fn SDL_GetSurfaceImages(surface: ?*Surface, count: ?*c_int) ?[*]?*Surface;
extern fn SDL_RemoveSurfaceAlternateImages(surface: ?*Surface) void;
extern fn SDL_LockSurface(surface: ?*Surface) bool;
extern fn SDL_UnlockSurface(surface: ?*Surface) void;
extern fn SDL_LoadBMP(file: ?[*:0]const u8) ?*Surface;
extern fn SDL_LoadBMP_IO(src: ?*IOStream, closeio: bool) ?*Surface;
extern fn SDL_SaveBMP(surface: ?*Surface, file: ?[*:0]const u8) bool;
extern fn SDL_SaveBMP_IO(surface: ?*Surface, dst: ?*IOStream, closeio: bool) bool;
extern fn SDL_SetSurfaceRLE(surface: ?*Surface, enabled: bool) bool;
extern fn SDL_SurfaceHasRLE(surface: ?*Surface) bool;
extern fn SDL_SetSurfaceColorKey(surface: ?*Surface, enabled: bool, key: u32) bool;
extern fn SDL_SurfaceHasColorKey(surface: ?*Surface) bool;
extern fn SDL_GetSurfaceColorKey(surface: ?*Surface, key: ?*u32) bool;
extern fn SDL_SetSurfaceColorMod(surface: ?*Surface, r: u8, g: u8, b: u8) bool;
extern fn SDL_GetSurfaceColorMod(surface: ?*Surface, r: ?*u8, g: ?*u8, b: ?*u8) bool;
extern fn SDL_SetSurfaceAlphaMod(surface: ?*Surface, alpha: u8) bool;
extern fn SDL_GetSurfaceAlphaMod(surface: ?*Surface, alpha: ?*u8) bool;
extern fn SDL_SetSurfaceBlendMode(surface: ?*Surface, blendMode: pixels.BlendMode) bool;
extern fn SDL_GetSurfaceBlendMode(surface: ?*Surface, blendMode: ?*pixels.BlendMode) bool;
extern fn SDL_SetSurfaceClipRect(surface: ?*Surface, rect: ?*const Rect) bool;
extern fn SDL_GetSurfaceClipRect(surface: ?*Surface, rect: ?*Rect) bool;
extern fn SDL_FlipSurface(surface: ?*Surface, flip: FlipMode) bool;
extern fn SDL_DuplicateSurface(surface: ?*Surface) ?*Surface;
extern fn SDL_ScaleSurface(surface: ?*Surface, width: c_int, height: c_int, scaleMode: c_int) ?*Surface;
extern fn SDL_ConvertSurface(surface: ?*Surface, format: Format) ?*Surface;
extern fn SDL_ConvertSurfaceAndColorspace(surface: ?*Surface, format: Format, palette: ?*Palette, colorspace: render.Colorspace, props: props.ID) ?*Surface;
extern fn SDL_PremultiplySurfaceAlpha(surface: ?*Surface, linear: bool) bool;
extern fn SDL_ClearSurface(surface: ?*Surface, r: f32, g: f32, b: f32, a: f32) bool;
extern fn SDL_FillSurfaceRect(surface: ?*Surface, rect: ?*const Rect, color: u32) bool;
extern fn SDL_FillSurfaceRects(surface: ?*Surface, rects: ?[*]const Rect, count: c_int, color: u32) bool;
extern fn SDL_BlitSurface(src: ?*Surface, srcrect: ?*const Rect, dst: ?*Surface, dstrect: ?*Rect) bool;
extern fn SDL_BlitSurfaceUnchecked(src: ?*Surface, srcrect: ?*const Rect, dst: ?*Surface, dstrect: ?*Rect) bool;
extern fn SDL_BlitSurfaceScaled(src: ?*Surface, srcrect: ?*const Rect, dst: ?*Surface, dstrect: ?*Rect, scaleMode: c_int) bool;
extern fn SDL_BlitSurfaceUncheckedScaled(src: ?*Surface, srcrect: ?*const Rect, dst: ?*Surface, dstrect: ?*Rect, scaleMode: c_int) bool;
extern fn SDL_BlitSurfaceTiled(src: ?*Surface, srcrect: ?*const Rect, dst: ?*Surface, dstrect: ?*Rect) bool;
extern fn SDL_BlitSurfaceTiledWithScale(src: ?*Surface, srcrect: ?*const Rect, scale: f32, scaleMode: c_int, dst: ?*Surface, dstrect: ?*Rect) bool;
extern fn SDL_BlitSurface9Grid(src: ?*Surface, srcrect: ?*const Rect, left_width: c_int, right_width: c_int, top_height: c_int, bottom_height: c_int, scale: f32, scaleMode: c_int, dst: ?*Surface, dstrect: ?*Rect) bool;
extern fn SDL_MapSurfaceRGB(surface: ?*Surface, r: u8, g: u8, b: u8) u32;
extern fn SDL_MapSurfaceRGBA(surface: ?*Surface, r: u8, g: u8, b: u8, a: u8) u32;
extern fn SDL_ReadSurfacePixel(surface: ?*Surface, x: c_int, y: c_int, r: ?*u8, g: ?*u8, b: ?*u8, a: ?*u8) bool;
extern fn SDL_PremultiplyAlpha(width: c_int, height: c_int, src_format: Format, src: ?*const anyopaque, src_pitch: c_int, dst_format: Format, dst: ?*anyopaque, dst_pitch: c_int, linear: bool) bool;
extern fn SDL_LoadSurface(file: ?[*:0]const u8) ?*Surface;
extern fn SDL_LoadSurface_IO(src: ?*IOStream, closeio: bool) ?*Surface;
extern fn SDL_LoadPNG(file: ?[*:0]const u8) ?*Surface;
extern fn SDL_LoadPNG_IO(src: ?*IOStream, closeio: bool) ?*Surface;
extern fn SDL_SavePNG(surface: ?*Surface, file: ?[*:0]const u8) bool;
extern fn SDL_SavePNG_IO(surface: ?*Surface, dst: ?*IOStream, closeio: bool) bool;
extern fn SDL_RotateSurface(surface: ?*Surface, angle: f32) ?*Surface;
extern fn SDL_ConvertPixels(width: c_int, height: c_int, src_format: Format, src: ?*const anyopaque, src_pitch: c_int, dst_format: Format, dst: ?*anyopaque, dst_pitch: c_int) bool;
extern fn SDL_StretchSurface(src: ?*Surface, srcrect: ?*const Rect, dst: ?*Surface, dstrect: ?*const Rect, scaleMode: render.ScaleMode) bool;
extern fn SDL_ReadSurfacePixelFloat(surface: ?*Surface, x: c_int, y: c_int, r: ?*f32, g: ?*f32, b: ?*f32, a: ?*f32) bool;
extern fn SDL_WriteSurfacePixel(surface: ?*Surface, x: c_int, y: c_int, r: u8, g: u8, b: u8, a: u8) bool;
extern fn SDL_WriteSurfacePixelFloat(surface: ?*Surface, x: c_int, y: c_int, r: f32, g: f32, b: f32, a: f32) bool;

// Public API
pub const create = SDL_CreateSurface;
pub const createFrom = SDL_CreateSurfaceFrom;
pub const destroy = SDL_DestroySurface;
pub const getProps = SDL_GetSurfaceProperties;
pub const setColorspace = SDL_SetSurfaceColorspace;
pub const getColorspace = SDL_GetSurfaceColorspace;
pub const createPalette = SDL_CreateSurfacePalette;
pub const setPalette = SDL_SetSurfacePalette;
pub const getPalette = SDL_GetSurfacePalette;
pub const addAlternateImage = SDL_AddSurfaceAlternateImage;
pub const HasAlternateImages = SDL_SurfaceHasAlternateImages;
pub const getImages = SDL_GetSurfaceImages;
pub const removeAlternateImages = SDL_RemoveSurfaceAlternateImages;
pub const lock = SDL_LockSurface;
pub const unlock = SDL_UnlockSurface;
pub const loadBMP = SDL_LoadBMP;
pub const loadBMP_IO = SDL_LoadBMP_IO;
pub const saveBMP = SDL_SaveBMP;
pub const saveBMP_IO = SDL_SaveBMP_IO;
pub const setRLE = SDL_SetSurfaceRLE;
pub const HasRLE = SDL_SurfaceHasRLE;
pub const setColorKey = SDL_SetSurfaceColorKey;
pub const HasColorKey = SDL_SurfaceHasColorKey;
pub const getColorKey = SDL_GetSurfaceColorKey;
pub const setColorMod = SDL_SetSurfaceColorMod;
pub const getColorMod = SDL_GetSurfaceColorMod;
pub const setAlphaMod = SDL_SetSurfaceAlphaMod;
pub const getAlphaMod = SDL_GetSurfaceAlphaMod;
pub const setBlendMode = SDL_SetSurfaceBlendMode;
pub const getBlendMode = SDL_GetSurfaceBlendMode;
pub const setClipRect = SDL_SetSurfaceClipRect;
pub const getClipRect = SDL_GetSurfaceClipRect;
pub const flip = SDL_FlipSurface;
pub const duplicate = SDL_DuplicateSurface;
pub const scale = SDL_ScaleSurface;
pub const convert = SDL_ConvertSurface;
pub const convertSurfaceAndColorspace = SDL_ConvertSurfaceAndColorspace;
pub const premultiplySurfaceAlpha = SDL_PremultiplySurfaceAlpha;
pub const clear = SDL_ClearSurface;
pub const fillRect = SDL_FillSurfaceRect;
pub const fillRects = SDL_FillSurfaceRects;
pub const blit = SDL_BlitSurface;
pub const blitUnchecked = SDL_BlitSurfaceUnchecked;
pub const blitScaled = SDL_BlitSurfaceScaled;
pub const blitUncheckedScaled = SDL_BlitSurfaceUncheckedScaled;
pub const blitTiled = SDL_BlitSurfaceTiled;
pub const blitTiledWithScale = SDL_BlitSurfaceTiledWithScale;
pub const blitSurface9Grid = SDL_BlitSurface9Grid;
pub const mapRGB = SDL_MapSurfaceRGB;
pub const mapRGBA = SDL_MapSurfaceRGBA;
pub const readPixel = SDL_ReadSurfacePixel;
pub const premultiplyAlpha = SDL_PremultiplyAlpha;
pub const load = SDL_LoadSurface;
pub const load_IO = SDL_LoadSurface_IO;
pub const loadPNG = SDL_LoadPNG;
pub const loadPNG_IO = SDL_LoadPNG_IO;
pub const savePNG = SDL_SavePNG;
pub const savePNG_IO = SDL_SavePNG_IO;
pub const rotate = SDL_RotateSurface;
pub const convertPixels = SDL_ConvertPixels;
pub const stretch = SDL_StretchSurface;
pub const readPixelFloat = SDL_ReadSurfacePixelFloat;
pub const writePixel = SDL_WriteSurfacePixel;
pub const writePixelFloat = SDL_WriteSurfacePixelFloat;
