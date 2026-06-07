// SDL3 Render Bindings
// 2D accelerated rendering

const core = @import("core.zig");
const pixels = @import("pixels.zig");
const props = @import("props.zig");
const Format = pixels.Format;
const BlendMode = pixels.BlendMode;
const Rect = pixels.Rect;
const FRect = pixels.FRect;
const FPoint = pixels.FPoint;
const surface = @import("surface.zig");
const Surface = surface.Surface;
const video = @import("video.zig");

// Import types
// Render structs
pub const Renderer = opaque {};
pub const Texture = opaque {};
pub const Vertex = extern struct {
    position: pixels.FPoint,
    color: FColor,
    tex_coord: pixels.FPoint,
};

// Color struct
pub const FColor = extern struct {
    r: f32,
    g: f32,
    b: f32,
    a: f32,
};

// Scale mode
pub const ScaleMode = enum(c_int) {
    INVALID = -1,
    NEAREST,
    LINEAR,
    PIXELART, // Available since SDL 3.4.0
};

// Logical presentation
pub const LogicalPresentation = enum(c_int) {
    DISABLED,
    STRETCH,
    LETTERBOX,
    OVERSCAN,
    INTEGER_SCALE,
};

// Texture access mode
pub const TextureAccess = enum(c_int) {
    STATIC = 0,
    STREAMING = 1,
    TARGET = 2,
};

// Texture address mode
pub const TextureAddressMode = enum(c_int) {
    INVALID = -1,
    AUTO,
    CLAMP,
    WRAP,
};

// Colorspace support
pub const Colorspace = enum(c_int) {
    UNKNOWN = 0,
    SRGB = 1,
    SRGB_LINEAR = 2,
};

// Renderer flags
pub const RENDERER_SOFTWARE: u32 = 0x00000001;
pub const RENDERER_ACCELERATED: u32 = 0x00000002;
pub const RENDERER_PRESENTVSYNC: u32 = 0x00000004;
pub const RENDERER_TARGETTEXTURE: u32 = 0x00000008;

// Texture access constants
pub const TEXTUREACCESS_STATIC: c_int = 0;
pub const TEXTUREACCESS_STREAMING: c_int = 1;
pub const TEXTUREACCESS_TARGET: c_int = 2;

// Texture creation property constants
pub const PROP_TEXTURE_CREATE_FORMAT_NUMBER = "format";
pub const PROP_TEXTURE_CREATE_ACCESS_NUMBER = "access";
pub const PROP_TEXTURE_CREATE_WIDTH_NUMBER = "width";
pub const PROP_TEXTURE_CREATE_HEIGHT_NUMBER = "height";
pub const PROP_TEXTURE_CREATE_COLORSPACE_NUMBER = "colorspace";

// Render functions
extern fn SDL_CreateRenderer(window: ?*video.WindowType, name: ?[*:0]const u8) ?*Renderer;
extern fn SDL_CreateRendererWithProperties(props: props.ID) ?*Renderer;
extern fn SDL_CreateGPURenderer(device: ?*anyopaque, window: ?*video.WindowType) ?*Renderer; // SDL_GPUDevice* - available since SDL 3.4.0
extern fn SDL_GetGPURendererDevice(renderer: ?*Renderer) ?*anyopaque; // Returns SDL_GPUDevice* - available since SDL 3.4.0
extern fn SDL_CreateSoftwareRenderer(surface: ?*Surface) ?*Renderer;
extern fn SDL_CreateWindowAndRenderer(title: ?[*:0]const u8, width: c_int, height: c_int, window_flags: video.WindowFlags, window: ?*?*video.WindowType, renderer: ?*?*Renderer) bool;
extern fn SDL_DestroyRenderer(renderer: ?*Renderer) void;
extern fn SDL_RenderClear(renderer: ?*Renderer) bool;
extern fn SDL_RenderPresent(renderer: ?*Renderer) bool;
extern fn SDL_SetRenderDrawColor(renderer: ?*Renderer, r: u8, g: u8, b: u8, a: u8) bool;
extern fn SDL_RenderPoint(renderer: ?*Renderer, x: f32, y: f32) bool;
extern fn SDL_RenderLine(renderer: ?*Renderer, x1: f32, y1: f32, x2: f32, y2: f32) bool;
extern fn SDL_RenderFillRect(renderer: ?*Renderer, rect: ?*const FRect) bool;
extern fn SDL_CreateTexture(renderer: ?*Renderer, format: u32, access: c_int, w: c_int, h: c_int) ?*Texture;
extern fn SDL_CreateTextureWithProperties(renderer: ?*Renderer, props: props.ID) ?*Texture;
extern fn SDL_DestroyTexture(texture: ?*Texture) void;
extern fn SDL_UpdateTexture(texture: ?*Texture, rect: ?*const pixels.Rect, pixels: ?*const anyopaque, pitch: c_int) bool;
extern fn SDL_RenderTexture(renderer: ?*Renderer, texture: ?*Texture, srcrect: ?*const FRect, dstrect: ?*const FRect) bool;
extern fn SDL_RenderGeometry(renderer: ?*Renderer, texture: ?*Texture, vertices: ?[*]const Vertex, num_vertices: c_int, indices: ?[*]const c_int, num_indices: c_int) bool;

// Renderer properties
extern fn SDL_GetRendererName(renderer: ?*Renderer) ?[*:0]const u8;
extern fn SDL_GetRendererProperties(renderer: ?*Renderer) props.ID;
extern fn SDL_GetRenderOutputSize(renderer: ?*Renderer, w: ?*c_int, h: ?*c_int) bool;
extern fn SDL_GetCurrentRenderOutputSize(renderer: ?*Renderer, w: ?*c_int, h: ?*c_int) bool;
extern fn SDL_GetRenderViewport(renderer: ?*Renderer, rect: ?*Rect) bool;
extern fn SDL_SetRenderViewport(renderer: ?*Renderer, rect: ?*const Rect) bool;
extern fn SDL_GetRenderSafeArea(renderer: ?*Renderer, rect: ?*Rect) bool;
extern fn SDL_GetRenderWindow(renderer: ?*Renderer) ?*video.WindowType;
extern fn SDL_GetRendererFromTexture(texture: ?*Texture) ?*Renderer;

// Draw operations
extern fn SDL_RenderPoints(renderer: ?*Renderer, points: ?[*]const pixels.FPoint, count: c_int) bool;
extern fn SDL_RenderLines(renderer: ?*Renderer, points: ?[*]const pixels.FPoint, count: c_int) bool;
extern fn SDL_RenderRect(renderer: ?*Renderer, rect: ?*const FRect) bool;
extern fn SDL_RenderRects(renderer: ?*Renderer, rects: ?[*]const FRect, count: c_int) bool;
extern fn SDL_RenderFillRects(renderer: ?*Renderer, rects: ?[*]const FRect, count: c_int) bool;

// Target rendering
extern fn SDL_SetRenderTarget(renderer: ?*Renderer, texture: ?*Texture) bool;
extern fn SDL_GetRenderTarget(renderer: ?*Renderer) ?*Texture;

// Color and blend
extern fn SDL_GetRenderDrawColor(renderer: ?*Renderer, r: ?*u8, g: ?*u8, b: ?*u8, a: ?*u8) bool;
extern fn SDL_GetRenderDrawBlendMode(renderer: ?*Renderer, blendMode: ?*BlendMode) bool;
extern fn SDL_SetRenderDrawBlendMode(renderer: ?*Renderer, blendMode: BlendMode) bool;

// Texture operations
extern fn SDL_CreateTextureFromSurface(renderer: ?*Renderer, surface: ?*surface.Surface) ?*Texture;
extern fn SDL_LockTexture(texture: ?*Texture, rect: ?*const pixels.Rect, pixels: ?*?*anyopaque, pitch: ?*c_int) bool;
extern fn SDL_LockTextureToSurface(texture: ?*Texture, rect: ?*const pixels.Rect, surface: ?*?*surface.Surface) bool;
extern fn SDL_UnlockTexture(texture: ?*Texture) void;
extern fn SDL_UpdateNVTexture(texture: ?*Texture, rect: ?*const pixels.Rect, y_plane: ?[*]const u8, y_pitch: c_int, uv_plane: ?[*]const u8, uv_pitch: c_int) bool;
extern fn SDL_UpdateYUVTexture(texture: ?*Texture, rect: ?*const pixels.Rect, y_plane: ?[*]const u8, y_pitch: c_int, u_plane: ?[*]const u8, u_pitch: c_int, v_plane: ?[*]const u8, v_pitch: c_int) bool;
extern fn SDL_SetTextureColorMod(texture: ?*Texture, r: u8, g: u8, b: u8) bool;
extern fn SDL_GetTextureColorMod(texture: ?*Texture, r: ?*u8, g: ?*u8, b: ?*u8) bool;
extern fn SDL_SetTextureAlphaMod(texture: ?*Texture, alpha: u8) bool;
extern fn SDL_GetTextureAlphaMod(texture: ?*Texture, alpha: ?*u8) bool;
extern fn SDL_SetTextureBlendMode(texture: ?*Texture, blendMode: BlendMode) bool;
extern fn SDL_GetTextureBlendMode(texture: ?*Texture, blendMode: ?*BlendMode) bool;
extern fn SDL_SetTextureScaleMode(texture: ?*Texture, scaleMode: ScaleMode) bool;
extern fn SDL_GetTextureScaleMode(texture: ?*Texture, scaleMode: ?*ScaleMode) bool;
extern fn SDL_GetTexturePalette(texture: ?*Texture) ?*pixels.Palette;
extern fn SDL_SetTexturePalette(texture: ?*Texture, palette: ?*pixels.Palette) bool;

// Clipping
extern fn SDL_SetRenderClipRect(renderer: ?*Renderer, rect: ?*const Rect) bool;
extern fn SDL_GetRenderClipRect(renderer: ?*Renderer, rect: ?*Rect) bool;
extern fn SDL_RenderClipEnabled(renderer: ?*Renderer) bool;

// Logical presentation
extern fn SDL_SetRenderLogicalPresentation(renderer: ?*Renderer, w: c_int, h: c_int, mode: LogicalPresentation) bool;
extern fn SDL_GetRenderLogicalPresentation(renderer: ?*Renderer, w: ?*c_int, h: ?*c_int, mode: ?*LogicalPresentation) bool;

// Debug
extern fn SDL_RenderDebugText(renderer: ?*Renderer, x: f32, y: f32, str: ?[*:0]const u8) bool;
extern fn SDL_RenderDebugTextFormat(renderer: ?*Renderer, x: f32, y: f32, fmt: ?[*:0]const u8, ...) bool;
extern fn SDL_RenderGeometryRaw(renderer: ?*Renderer, texture: ?*Texture, xy: ?[*]const f32, xy_stride: c_int, color: ?[*]const FColor, color_stride: c_int, uv: ?[*]const f32, uv_stride: c_int, num_vertices: c_int, indices: ?*const anyopaque, num_indices: c_int, size_indices: c_int) bool;
extern fn SDL_RenderReadPixels(renderer: ?*Renderer, rect: ?*const pixels.Rect) ?*pixels.Surface;
extern fn SDL_FlushRenderer(renderer: ?*Renderer) bool;

// Query functions
extern fn SDL_GetNumRenderDrivers() c_int;
extern fn SDL_GetRenderDriver(index: c_int) ?[*:0]const u8;
extern fn SDL_GetRenderer(window: ?*video.WindowType) ?*Renderer;

// Coordinate system functions
extern fn SDL_RenderCoordinatesFromWindow(renderer: ?*Renderer, window_x: f32, window_y: f32, render_x: ?*f32, render_y: ?*f32) bool;
extern fn SDL_RenderCoordinatesToWindow(renderer: ?*Renderer, render_x: f32, render_y: f32, window_x: ?*f32, window_y: ?*f32) bool;
extern fn SDL_ConvertEventToRenderCoordinates(renderer: ?*Renderer, event: ?*core.Event) bool;

// Scale and color functions
extern fn SDL_SetRenderScale(renderer: ?*Renderer, scale_x: f32, scale_y: f32) bool;
extern fn SDL_GetRenderScale(renderer: ?*Renderer, scale_x: ?*f32, scale_y: ?*f32) bool;
extern fn SDL_SetRenderDrawColorFloat(renderer: ?*Renderer, r: f32, g: f32, b: f32, a: f32) bool;
extern fn SDL_GetRenderDrawColorFloat(renderer: ?*Renderer, r: ?*f32, g: ?*f32, b: ?*f32, a: ?*f32) bool;

// Float texture modulation
extern fn SDL_SetTextureColorModFloat(texture: ?*Texture, r: f32, g: f32, b: f32) bool;
extern fn SDL_GetTextureColorModFloat(texture: ?*Texture, r: ?*f32, g: ?*f32, b: ?*f32) bool;
extern fn SDL_SetTextureAlphaModFloat(texture: ?*Texture, alpha: f32) bool;
extern fn SDL_GetTextureAlphaModFloat(texture: ?*Texture, alpha: ?*f32) bool;

// Address modes
extern fn SDL_SetRenderTextureAddressMode(renderer: ?*Renderer, u_mode: TextureAddressMode, v_mode: TextureAddressMode) bool;
extern fn SDL_GetRenderTextureAddressMode(renderer: ?*Renderer, u_mode: ?*TextureAddressMode, v_mode: ?*TextureAddressMode) bool;

// Advanced texture rendering
extern fn SDL_RenderTexture9Grid(renderer: ?*Renderer, texture: ?*Texture, srcrect: ?*const FRect, left_width: f32, right_width: f32, top_height: f32, bottom_height: f32, scale: f32, dstrect: ?*const FRect) bool;
extern fn SDL_RenderTexture9GridTiled(renderer: ?*Renderer, texture: ?*Texture, srcrect: ?*const FRect, left_width: f32, right_width: f32, top_height: f32, bottom_height: f32, scale: f32, dstrect: ?*const FRect, tileScale: f32) bool;
extern fn SDL_RenderTextureAffine(renderer: ?*Renderer, texture: ?*Texture, srcrect: ?*const FRect, origin: ?*const FPoint, right: ?*const FPoint, down: ?*const FPoint) bool;
extern fn SDL_RenderTextureRotated(renderer: ?*Renderer, texture: ?*Texture, srcrect: ?*const FRect, dstrect: ?*const FRect, angle: f64, center: ?*const FPoint, flip: surface.FlipMode) bool;
extern fn SDL_RenderTextureTiled(renderer: ?*Renderer, texture: ?*Texture, srcrect: ?*const FRect, scale: f32, dstrect: ?*const FRect) bool;

// Utility functions
extern fn SDL_GetDefaultTextureScaleMode(renderer: ?*Renderer, scale_mode: ?*ScaleMode) bool;
extern fn SDL_SetDefaultTextureScaleMode(renderer: ?*Renderer, scale_mode: ScaleMode) bool;
extern fn SDL_GetRenderLogicalPresentationRect(renderer: ?*Renderer, rect: ?*FRect) bool;

// Additional render functions
extern fn SDL_GetTextureProperties(texture: ?*Texture) props.ID;
extern fn SDL_RenderViewportSet(renderer: ?*Renderer) bool;
extern fn SDL_SetRenderColorScale(renderer: ?*Renderer, scale: f32) bool;
extern fn SDL_GetRenderColorScale(renderer: ?*Renderer, scale: ?*f32) bool;

// Texture operations
extern fn SDL_GetTextureSize(texture: ?*Texture, w: ?*f32, h: ?*f32) bool;
extern fn SDL_GetRenderVSync(renderer: ?*Renderer, vsync: ?*c_int) bool;
extern fn SDL_SetRenderVSync(renderer: ?*Renderer, vsync: c_int) bool;

// Public API
pub const create = SDL_CreateRenderer;
pub const createWithProps = SDL_CreateRendererWithProperties;
pub const createGPURenderer = SDL_CreateGPURenderer;
pub const getGPURendererDevice = SDL_GetGPURendererDevice;
pub const createSoftwareRenderer = SDL_CreateSoftwareRenderer;
pub const createWindowAndRenderer = SDL_CreateWindowAndRenderer;
pub const destroy = SDL_DestroyRenderer;
pub const clear = SDL_RenderClear;
pub const isPresent = SDL_RenderPresent;
pub const setDrawColor = SDL_SetRenderDrawColor;
pub const createTexture = SDL_CreateTexture;
pub const createTextureWithProps = SDL_CreateTextureWithProperties;
pub const destroyTexture = SDL_DestroyTexture;
pub const renderTexture = SDL_RenderTexture;
pub const renderGeometry = SDL_RenderGeometry;
pub const getName = SDL_GetRendererName;
pub const getProps = SDL_GetRendererProperties;
pub const getOutputSize = SDL_GetRenderOutputSize;
pub const getCurrentOutputSize = SDL_GetCurrentRenderOutputSize;
pub const getViewport = SDL_GetRenderViewport;
pub const setViewport = SDL_SetRenderViewport;
pub const getSafeArea = SDL_GetRenderSafeArea;
pub const getWindow = SDL_GetRenderWindow;
pub const getRendererFromTexture = SDL_GetRendererFromTexture;
pub const renderPoint = SDL_RenderPoint;
pub const renderPoints = SDL_RenderPoints;
pub const renderLine = SDL_RenderLine;
pub const renderLines = SDL_RenderLines;
pub const renderRect = SDL_RenderRect;
pub const renderRects = SDL_RenderRects;
pub const renderFillRect = SDL_RenderFillRect;
pub const renderFillRects = SDL_RenderFillRects;
pub const setTarget = SDL_SetRenderTarget;
pub const getTarget = SDL_GetRenderTarget;
pub const getDrawColor = SDL_GetRenderDrawColor;
pub const getDrawBlendMode = SDL_GetRenderDrawBlendMode;
pub const setDrawBlendMode = SDL_SetRenderDrawBlendMode;
pub const createTextureFromSurface = SDL_CreateTextureFromSurface;
pub const lockTexture = SDL_LockTexture;
pub const lockTextureToSurface = SDL_LockTextureToSurface;
pub const unlockTexture = SDL_UnlockTexture;
pub const updateTexture = SDL_UpdateTexture;
pub const updateNVTexture = SDL_UpdateNVTexture;
pub const updateYUVTexture = SDL_UpdateYUVTexture;
pub const setTextureColorMod = SDL_SetTextureColorMod;
pub const getTextureColorMod = SDL_GetTextureColorMod;
pub const setTextureAlphaMod = SDL_SetTextureAlphaMod;
pub const getTextureAlphaMod = SDL_GetTextureAlphaMod;
pub const setTextureBlendMode = SDL_SetTextureBlendMode;
pub const getTextureBlendMode = SDL_GetTextureBlendMode;
pub const setTextureScaleMode = SDL_SetTextureScaleMode;
pub const getTextureScaleMode = SDL_GetTextureScaleMode;
pub const getTextureSize = SDL_GetTextureSize;
pub const getTexturePalette = SDL_GetTexturePalette;
pub const setTexturePalette = SDL_SetTexturePalette;
pub const setRenderClipRect = SDL_SetRenderClipRect;
pub const getRenderClipRect = SDL_GetRenderClipRect;
pub const renderClipEnabled = SDL_RenderClipEnabled;
pub const setLogicalPresentation = SDL_SetRenderLogicalPresentation;
pub const getLogicalPresentation = SDL_GetRenderLogicalPresentation;
pub const renderDebugText = SDL_RenderDebugText;
pub const renderDebugTextFormat = SDL_RenderDebugTextFormat;
pub const renderGeometryRaw = SDL_RenderGeometryRaw;
pub const renderReadPixels = SDL_RenderReadPixels;
pub const flush = SDL_FlushRenderer;
pub const getRenderVSync = SDL_GetRenderVSync;
pub const setRenderVSync = SDL_SetRenderVSync;
pub const getNumDrivers = SDL_GetNumRenderDrivers;
pub const getDriver = SDL_GetRenderDriver;
pub const getRenderer = SDL_GetRenderer;
pub const renderCoordinatesFromWindow = SDL_RenderCoordinatesFromWindow;
pub const renderCoordinatesToWindow = SDL_RenderCoordinatesToWindow;
pub const convertEventToRenderCoordinates = SDL_ConvertEventToRenderCoordinates;
pub const setScale = SDL_SetRenderScale;
pub const getScale = SDL_GetRenderScale;
pub const setDrawColorFloat = SDL_SetRenderDrawColorFloat;
pub const getDrawColorFloat = SDL_GetRenderDrawColorFloat;
pub const setTextureColorModFloat = SDL_SetTextureColorModFloat;
pub const getTextureColorModFloat = SDL_GetTextureColorModFloat;
pub const setTextureAlphaModFloat = SDL_SetTextureAlphaModFloat;
pub const getTextureAlphaModFloat = SDL_GetTextureAlphaModFloat;
pub const setRenderTextureAddressMode = SDL_SetRenderTextureAddressMode;
pub const getRenderTextureAddressMode = SDL_GetRenderTextureAddressMode;
pub const renderTexture9Grid = SDL_RenderTexture9Grid;
pub const renderTexture9GridTiled = SDL_RenderTexture9GridTiled;
pub const renderTextureAffine = SDL_RenderTextureAffine;
pub const renderTextureRotated = SDL_RenderTextureRotated;
pub const renderTextureTiled = SDL_RenderTextureTiled;
pub const getDefaultTextureScaleMode = SDL_GetDefaultTextureScaleMode;
pub const setDefaultTextureScaleMode = SDL_SetDefaultTextureScaleMode;
pub const getLogicalPresentationRect = SDL_GetRenderLogicalPresentationRect;
pub const getTextureProps = SDL_GetTextureProperties;
pub const isViewportSet = SDL_RenderViewportSet;
pub const setColorScale = SDL_SetRenderColorScale;
pub const getColorScale = SDL_GetRenderColorScale;
