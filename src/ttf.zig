// SDL3 TTF Bindings
// TrueType font rendering

const fs = @import("fs.zig");
const pixels = @import("pixels.zig");
const surface = @import("surface.zig");
const render = @import("render.zig");
const props = @import("props.zig");

// Import types
const PropertiesID = props.ID;
const Surface = surface.Surface;
const IOStream = fs.IOStream;
const Color = pixels.Color;
const FColor = render.FColor;

// Version constants
pub const MAJOR_VERSION = 3;
pub const MINOR_VERSION = 3;
pub const MICRO_VERSION = 0;

// Opaque font type
pub const Font = opaque {};

// Font style flags
pub const StyleFlags = u32;
pub const STYLE_NORMAL: StyleFlags = 0x00;
pub const STYLE_BOLD: StyleFlags = 0x01;
pub const STYLE_ITALIC: StyleFlags = 0x02;
pub const STYLE_UNDERLINE: StyleFlags = 0x04;
pub const STYLE_STRIKETHROUGH: StyleFlags = 0x08;

// Hinting flags
pub const HintingFlags = enum(c_int) {
    INVALID = -1,
    NORMAL,
    LIGHT,
    MONO,
    NONE,
    LIGHT_SUBPIXEL,
};

// Horizontal alignment
pub const HorizontalAlignment = enum(c_int) {
    INVALID = -1,
    LEFT,
    CENTER,
    RIGHT,
};

// Font weight constants
pub const WEIGHT_THIN = 100;
pub const WEIGHT_EXTRA_LIGHT = 200;
pub const WEIGHT_LIGHT = 300;
pub const WEIGHT_NORMAL = 400;
pub const WEIGHT_MEDIUM = 500;
pub const WEIGHT_SEMI_BOLD = 600;
pub const WEIGHT_BOLD = 700;
pub const WEIGHT_EXTRA_BOLD = 800;
pub const WEIGHT_BLACK = 900;
pub const WEIGHT_EXTRA_BLACK = 950;

// Property constants
pub const PROP_FONT_CREATE_FILENAME_STRING = "SDL_ttf.font.create.filename";
pub const PROP_FONT_CREATE_IOSTREAM_POINTER = "SDL_ttf.font.create.iostream";
pub const PROP_FONT_CREATE_IOSTREAM_OFFSET_NUMBER = "SDL_ttf.font.create.iostream.offset";
pub const PROP_FONT_CREATE_IOSTREAM_AUTOCLOSE_BOOLEAN = "SDL_ttf.font.create.iostream.autoclose";
pub const PROP_FONT_CREATE_SIZE_FLOAT = "SDL_ttf.font.create.size";
pub const PROP_FONT_CREATE_FACE_NUMBER = "SDL_ttf.font.create.face";
pub const PROP_FONT_CREATE_HORIZONTAL_DPI_NUMBER = "SDL_ttf.font.create.hdpi";
pub const PROP_FONT_CREATE_VERTICAL_DPI_NUMBER = "SDL_ttf.font.create.vdpi";
pub const PROP_FONT_CREATE_EXISTING_FONT_POINTER = "SDL_ttf.font.create.existing_font";
pub const PROP_FONT_OUTLINE_LINE_CAP_NUMBER = "SDL_ttf.font.outline.line_cap";
pub const PROP_FONT_OUTLINE_LINE_JOIN_NUMBER = "SDL_ttf.font.outline.line_join";
pub const PROP_FONT_OUTLINE_MITER_LIMIT_NUMBER = "SDL_ttf.font.outline.miter_limit";

// Version functions
extern fn TTF_Version() c_int;
extern fn TTF_GetFreeTypeVersion(major: ?*c_int, minor: ?*c_int, patch: ?*c_int) void;
extern fn TTF_GetHarfBuzzVersion(major: ?*c_int, minor: ?*c_int, patch: ?*c_int) void;

// Initialization
extern fn TTF_Init() bool;
extern fn TTF_Quit() void;

// Font creation
extern fn TTF_OpenFont(file: [*:0]const u8, ptsize: f32) ?*Font;
extern fn TTF_OpenFontIO(src: ?*IOStream, closeio: bool, ptsize: f32) ?*Font;
extern fn TTF_OpenFontWithProperties(props: PropertiesID) ?*Font;
extern fn TTF_CopyFont(existing_font: ?*Font) ?*Font;
extern fn TTF_CloseFont(font: ?*Font) void;

// Font properties
extern fn TTF_GetFontProperties(font: ?*Font) PropertiesID;
extern fn TTF_GetFontGeneration(font: ?*Font) u32;

// Fallback fonts
extern fn TTF_AddFallbackFont(font: ?*Font, fallback: ?*Font) bool;
extern fn TTF_RemoveFallbackFont(font: ?*Font, fallback: ?*Font) void;
extern fn TTF_ClearFallbackFonts(font: ?*Font) void;

// Font size
extern fn TTF_SetFontSize(font: ?*Font, ptsize: f32) bool;
extern fn TTF_SetFontSizeDPI(font: ?*Font, ptsize: f32, hdpi: c_int, vdpi: c_int) bool;
extern fn TTF_GetFontSize(font: ?*Font) f32;
extern fn TTF_GetFontDPI(font: ?*Font, hdpi: ?*c_int, vdpi: ?*c_int) bool;

// Font style
extern fn TTF_SetFontStyle(font: ?*Font, style: StyleFlags) void;
extern fn TTF_GetFontStyle(font: ?*const Font) StyleFlags;

// Font outline
extern fn TTF_SetFontOutline(font: ?*Font, outline: c_int) bool;
extern fn TTF_GetFontOutline(font: ?*const Font) c_int;

// Font hinting
extern fn TTF_SetFontHinting(font: ?*Font, hinting: HintingFlags) void;
extern fn TTF_GetFontHinting(font: ?*const Font) HintingFlags;
extern fn TTF_GetNumFontFaces(font: ?*const Font) c_int;

// Font SDF
extern fn TTF_SetFontSDF(font: ?*Font, enabled: bool) bool;
extern fn TTF_GetFontSDF(font: ?*const Font) bool;

// Font weight
extern fn TTF_GetFontWeight(font: ?*const Font) c_int;

// Font wrap alignment
extern fn TTF_SetFontWrapAlignment(font: ?*Font, alignment: HorizontalAlignment) void;
extern fn TTF_GetFontWrapAlignment(font: ?*const Font) HorizontalAlignment;

// Font metrics
extern fn TTF_GetFontHeight(font: ?*const Font) c_int;
extern fn TTF_GetFontAscent(font: ?*const Font) c_int;
extern fn TTF_GetFontDescent(font: ?*const Font) c_int;
extern fn TTF_SetFontLineSkip(font: ?*Font, lineskip: c_int) void;
extern fn TTF_GetFontLineSkip(font: ?*const Font) c_int;

// Font kerning
extern fn TTF_SetFontKerning(font: ?*Font, enabled: bool) void;
extern fn TTF_GetFontKerning(font: ?*const Font) bool;

// Font queries
extern fn TTF_FontIsFixedWidth(font: ?*const Font) bool;
extern fn TTF_FontIsScalable(font: ?*const Font) bool;
extern fn TTF_GetFontFamilyName(font: ?*const Font) ?[*:0]const u8;
extern fn TTF_GetFontStyleName(font: ?*const Font) ?[*:0]const u8;

// Glyph metrics
extern fn TTF_GetGlyphMetrics(font: ?*const Font, ch: u32, minx: ?*c_int, maxx: ?*c_int, miny: ?*c_int, maxy: ?*c_int, advance: ?*c_int) bool;
extern fn TTF_GetGlyphAdvance(font: ?*const Font, ch: u32) c_int;

// Text size
extern fn TTF_GetStringSize(font: ?*const Font, text: [*:0]const u8, length: usize, w: ?*c_int, h: ?*c_int) bool;
extern fn TTF_GetStringSizeWrapped(font: ?*const Font, text: [*:0]const u8, length: usize, wrap_width: c_int, w: ?*c_int, h: ?*c_int) bool;

// Text rendering (Solid)
extern fn TTF_RenderText_Solid(font: ?*const Font, text: [*:0]const u8, length: usize, fg: Color) ?*Surface;
extern fn TTF_RenderUTF8_Solid(font: ?*const Font, text: [*:0]const u8, length: usize, fg: Color) ?*Surface;
extern fn TTF_RenderUNICODE_Solid(font: ?*const Font, text: [*]const u16, length: usize, fg: Color) ?*Surface;

// Text rendering (Shaded)
extern fn TTF_RenderText_Shaded(font: ?*const Font, text: [*:0]const u8, length: usize, fg: Color, bg: Color) ?*Surface;
extern fn TTF_RenderUTF8_Shaded(font: ?*const Font, text: [*:0]const u8, length: usize, fg: Color, bg: Color) ?*Surface;
extern fn TTF_RenderUNICODE_Shaded(font: ?*const Font, text: [*]const u16, length: usize, fg: Color, bg: Color) ?*Surface;

// Text rendering (Blended)
extern fn TTF_RenderText_Blended(font: ?*const Font, text: [*:0]const u8, length: usize, fg: Color) ?*Surface;
extern fn TTF_RenderUTF8_Blended(font: ?*const Font, text: [*:0]const u8, length: usize, fg: Color) ?*Surface;
extern fn TTF_RenderUNICODE_Blended(font: ?*const Font, text: [*]const u16, length: usize, fg: Color) ?*Surface;

// Text rendering (Blended with wrap)
extern fn TTF_RenderText_Blended_Wrapped(font: ?*const Font, text: [*:0]const u8, length: usize, fg: Color, wrapLength: c_int) ?*Surface;
extern fn TTF_RenderUTF8_Blended_Wrapped(font: ?*const Font, text: [*:0]const u8, length: usize, fg: Color, wrapLength: c_int) ?*Surface;
extern fn TTF_RenderUNICODE_Blended_Wrapped(font: ?*const Font, text: [*]const u16, length: usize, fg: Color, wrapLength: c_int) ?*Surface;

// Text rendering (Blended with float color)
extern fn TTF_RenderText_Blended_Float(font: ?*const Font, text: [*:0]const u8, length: usize, fg: FColor) ?*Surface;
extern fn TTF_RenderUTF8_Blended_Float(font: ?*const Font, text: [*:0]const u8, length: usize, fg: FColor) ?*Surface;
extern fn TTF_RenderUNICODE_Blended_Float(font: ?*const Font, text: [*]const u16, length: usize, fg: FColor) ?*Surface;

// Text rendering (Blended with float color and wrap)
extern fn TTF_RenderText_Blended_Float_Wrapped(font: ?*const Font, text: [*:0]const u8, length: usize, fg: FColor, wrapLength: c_int) ?*Surface;
extern fn TTF_RenderUTF8_Blended_Float_Wrapped(font: ?*const Font, text: [*:0]const u8, length: usize, fg: FColor, wrapLength: c_int) ?*Surface;
extern fn TTF_RenderUNICODE_Blended_Float_Wrapped(font: ?*const Font, text: [*]const u16, length: usize, fg: FColor, wrapLength: c_int) ?*Surface;

// Public API
pub const version = TTF_Version;
pub const getFreeTypeVersion = TTF_GetFreeTypeVersion;
pub const getHarfBuzzVersion = TTF_GetHarfBuzzVersion;
pub const init = TTF_Init;
pub const quit = TTF_Quit;
pub const openFont = TTF_OpenFont;
pub const openFontIO = TTF_OpenFontIO;
pub const openFontWithProps = TTF_OpenFontWithProperties;
pub const copyFont = TTF_CopyFont;
pub const closeFont = TTF_CloseFont;
pub const getFontProps = TTF_GetFontProperties;
pub const getFontGeneration = TTF_GetFontGeneration;
pub const addFallbackFont = TTF_AddFallbackFont;
pub const removeFallbackFont = TTF_RemoveFallbackFont;
pub const clearFallbackFonts = TTF_ClearFallbackFonts;
pub const setFontSize = TTF_SetFontSize;
pub const setFontSizeDPI = TTF_SetFontSizeDPI;
pub const getFontSize = TTF_GetFontSize;
pub const getFontDPI = TTF_GetFontDPI;
pub const setFontStyle = TTF_SetFontStyle;
pub const getFontStyle = TTF_GetFontStyle;
pub const setFontOutline = TTF_SetFontOutline;
pub const getFontOutline = TTF_GetFontOutline;
pub const setFontHinting = TTF_SetFontHinting;
pub const getFontHinting = TTF_GetFontHinting;
pub const getNumFontFaces = TTF_GetNumFontFaces;
pub const setFontSDF = TTF_SetFontSDF;
pub const getFontSDF = TTF_GetFontSDF;
pub const getFontWeight = TTF_GetFontWeight;
pub const setFontWrapAlignment = TTF_SetFontWrapAlignment;
pub const getFontWrapAlignment = TTF_GetFontWrapAlignment;
pub const getFontHeight = TTF_GetFontHeight;
pub const getFontAscent = TTF_GetFontAscent;
pub const getFontDescent = TTF_GetFontDescent;
pub const setFontLineSkip = TTF_SetFontLineSkip;
pub const getFontLineSkip = TTF_GetFontLineSkip;
pub const setFontKerning = TTF_SetFontKerning;
pub const getFontKerning = TTF_GetFontKerning;
pub const fontIsFixedWidth = TTF_FontIsFixedWidth;
pub const fontIsScalable = TTF_FontIsScalable;
pub const getFontFamilyName = TTF_GetFontFamilyName;
pub const getFontStyleName = TTF_GetFontStyleName;
pub const getGlyphMetrics = TTF_GetGlyphMetrics;
pub const getGlyphAdvance = TTF_GetGlyphAdvance;
pub const getStringSize = TTF_GetStringSize;
pub const getStringSizeWrapped = TTF_GetStringSizeWrapped;
pub const renderTextSolid = TTF_RenderText_Solid;
pub const renderUTF8Solid = TTF_RenderUTF8_Solid;
pub const renderUNICODESolid = TTF_RenderUNICODE_Solid;
pub const renderTextShaded = TTF_RenderText_Shaded;
pub const renderUTF8Shaded = TTF_RenderUTF8_Shaded;
pub const renderUNICODEShaded = TTF_RenderUNICODE_Shaded;
pub const renderTextBlended = TTF_RenderText_Blended;
pub const renderUTF8Blended = TTF_RenderUTF8_Blended;
pub const renderUNICODEBlended = TTF_RenderUNICODE_Blended;
pub const renderTextBlendedWrapped = TTF_RenderText_Blended_Wrapped;
pub const renderUTF8BlendedWrapped = TTF_RenderUTF8_Blended_Wrapped;
pub const renderUNICODEBlendedWrapped = TTF_RenderUNICODE_Blended_Wrapped;
pub const renderTextBlendedFloat = TTF_RenderText_Blended_Float;
pub const renderUTF8BlendedFloat = TTF_RenderUTF8_Blended_Float;
pub const renderUNICODEBlendedFloat = TTF_RenderUNICODE_Blended_Float;
pub const renderTextBlendedFloatWrapped = TTF_RenderText_Blended_Float_Wrapped;
pub const renderUTF8BlendedFloatWrapped = TTF_RenderUTF8_Blended_Float_Wrapped;
pub const renderUNICODEBlendedFloatWrapped = TTF_RenderUNICODE_Blended_Float_Wrapped;
