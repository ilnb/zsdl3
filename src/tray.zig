// SDL3 Tray Bindings
// System tray icons

const video = @import("video.zig");

// Tray structs
pub const Tray = opaque {};
pub const Menu = opaque {};
pub const Entry = opaque {};

// Tray functions
extern fn SDL_CreateTray(icon: ?*video.Surface, tooltip: ?[*:0]const u8) ?*Tray;
extern fn SDL_SetTrayIcon(tray: ?*Tray, icon: ?*video.Surface) void;
extern fn SDL_SetTrayTooltip(tray: ?*Tray, tooltip: ?[*:0]const u8) void;
extern fn SDL_CreateTrayMenu(tray: ?*Tray) ?*Menu;
extern fn SDL_CreateTraySubmenu(entry: ?*Entry) ?*Menu;
extern fn SDL_GetTrayMenu(tray: ?*Tray) ?*Menu;
extern fn SDL_GetTraySubmenu(entry: ?*Entry) ?*Menu;
extern fn SDL_GetTrayEntries(menu: ?*Menu, count: ?*c_int) ?[*]?*const Entry;
extern fn SDL_RemoveTrayEntry(entry: ?*Entry) void;
extern fn SDL_InsertTrayEntryAt(menu: ?*Menu, pos: c_int, label: ?[*:0]const u8, flags: c_uint) ?*Entry;
extern fn SDL_SetTrayEntryLabel(entry: ?*Entry, label: ?[*:0]const u8) void;
extern fn SDL_GetTrayEntryLabel(entry: ?*Entry) ?[*:0]const u8;
extern fn SDL_SetTrayEntryChecked(entry: ?*Entry, checked: bool) void;
extern fn SDL_GetTrayEntryChecked(entry: ?*Entry) bool;
extern fn SDL_SetTrayEntryEnabled(entry: ?*Entry, enabled: bool) void;
extern fn SDL_GetTrayEntryEnabled(entry: ?*Entry) bool;
extern fn SDL_SetTrayEntryCallback(entry: ?*Entry, callback: ?*const fn (?*anyopaque, ?*Entry) callconv(.c) void, userdata: ?*anyopaque) void;
extern fn SDL_ClickTrayEntry(entry: ?*Entry) void;
extern fn SDL_DestroyTray(tray: ?*Tray) void;
extern fn SDL_GetTrayEntryParent(entry: ?*Entry) ?*Menu;
extern fn SDL_GetTrayMenuParentTray(menu: ?*Menu) ?*Tray;
extern fn SDL_GetTrayMenuParentEntry(menu: ?*Menu) ?*Entry;
extern fn SDL_UpdateTrays() void;

// Public API
pub const create = SDL_CreateTray;
pub const setIcon = SDL_SetTrayIcon;
pub const setTooltip = SDL_SetTrayTooltip;
pub const createMenu = SDL_CreateTrayMenu;
pub const createSubmenu = SDL_CreateTraySubmenu;
pub const getMenu = SDL_GetTrayMenu;
pub const getSubmenu = SDL_GetTraySubmenu;
pub const getEntries = SDL_GetTrayEntries;
pub const removeEntry = SDL_RemoveTrayEntry;
pub const insertEntryAt = SDL_InsertTrayEntryAt;
pub const setEntryLabel = SDL_SetTrayEntryLabel;
pub const getEntryLabel = SDL_GetTrayEntryLabel;
pub const setEntryChecked = SDL_SetTrayEntryChecked;
pub const getEntryChecked = SDL_GetTrayEntryChecked;
pub const setEntryEnabled = SDL_SetTrayEntryEnabled;
pub const getEntryEnabled = SDL_GetTrayEntryEnabled;
pub const setEntryCallback = SDL_SetTrayEntryCallback;
pub const clickEntry = SDL_ClickTrayEntry;
pub const destroy = SDL_DestroyTray;
pub const getEntryParent = SDL_GetTrayEntryParent;
pub const getMenuParentTray = SDL_GetTrayMenuParentTray;
pub const getMenuParentEntry = SDL_GetTrayMenuParentEntry;
pub const updateTrays = SDL_UpdateTrays;
