// SDL3 GUID Bindings
// Unique identifier generation and handling

// GUID struct
pub const GUID = extern struct {
    data: [16]u8,
};

// GUID functions
extern fn SDL_GUIDToString(guid: GUID, pszGUID: ?[*:0]u8, cbGUID: c_int) void;
extern fn SDL_StringToGUID(pchGUID: ?[*:0]const u8) GUID;

// Public API
pub const toString = SDL_GUIDToString;
pub const fromString = SDL_StringToGUID;
