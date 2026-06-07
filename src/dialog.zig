// SDL3 Dialog Bindings
// File and message dialogs

const core = @import("core.zig");
const props = @import("props.zig");
const video = @import("video.zig");

// Dialog callbacks
pub const FileCallback = ?*const fn (?*anyopaque, ?[*]const ?[*:0]const u8, c_int) callconv(.c) void;

// File dialog type enum
pub const FileDialogType = enum(c_int) {
    OPENFILE,
    SAVEFILE,
    OPENFOLDER,
};

// Dialog functions
extern fn SDL_ShowOpenFileDialog(callback: FileCallback, userdata: ?*anyopaque, window: ?*video.WindowType, filters: ?[*]const FileFilter, nfilters: c_int, default_location: ?[*:0]const u8, allow_many: bool) void;
extern fn SDL_ShowSaveFileDialog(callback: FileCallback, userdata: ?*anyopaque, window: ?*video.WindowType, filters: ?[*]const FileFilter, nfilters: c_int, default_location: ?[*:0]const u8) void;
extern fn SDL_ShowOpenFolderDialog(callback: FileCallback, userdata: ?*anyopaque, window: ?*video.WindowType, default_location: ?[*:0]const u8, allow_many: bool) void;
extern fn SDL_ShowFileDialogWithProperties(dialog_type: FileDialogType, callback: FileCallback, userdata: ?*anyopaque, props: props.ID) void;

// Dialog file filter
pub const FileFilter = extern struct {
    name: ?[*:0]const u8,
    pattern: ?[*:0]const u8,
};

// Public API
pub const showOpenFile = SDL_ShowOpenFileDialog;
pub const showSaveFile = SDL_ShowSaveFileDialog;
pub const showOpenFolder = SDL_ShowOpenFolderDialog;
pub const showFileWithProps = SDL_ShowFileDialogWithProperties;
