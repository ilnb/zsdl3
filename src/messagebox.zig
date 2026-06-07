// SDL3 Messagebox Bindings
// System message boxes

const video = @import("video.zig");

// Messagebox types
pub const Flags = u32;
pub const MESSAGEBOX_ERROR = 0x00000010;
pub const MESSAGEBOX_WARNING = 0x00000020;
pub const MESSAGEBOX_INFORMATION = 0x00000040;

pub const Button = extern struct {
    flags: u32,
    buttonid: c_int,
    text: ?[*:0]const u8,
};

pub const Color = extern struct {
    r: u8,
    g: u8,
    b: u8,
};

pub const ColorScheme = extern struct {
    colors: [5]Color,
};

pub const Data = extern struct {
    flags: Flags,
    window: ?*video.WindowType,
    title: ?[*:0]const u8,
    message: ?[*:0]const u8,
    numbuttons: c_int,
    buttons: ?[*]const Button,
    colorScheme: ?*const ColorScheme,
};

// Messagebox functions
extern fn SDL_ShowMessageBox(data: ?*const Data, buttonid: ?*c_int) bool;
extern fn SDL_ShowSimpleMessageBox(flags: Flags, title: ?[*:0]const u8, message: ?[*:0]const u8, window: ?*video.WindowType) bool;

// Public API
pub const show = SDL_ShowMessageBox;
pub const showSimple = SDL_ShowSimpleMessageBox;
