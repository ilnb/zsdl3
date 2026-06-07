const props = @import("props.zig");
const pixels = @import("pixels.zig");
const surface = @import("surface.zig");

pub const ID = u32;
pub const Camera = opaque {};
pub const Colorspace = u32;

pub const Spec = extern struct {
    format: pixels.Format,
    colorspace: u32, // SDL_Colorspace (u32)
    width: c_int,
    height: c_int,
    framerate_numerator: c_int,
    framerate_denominator: c_int,
};

pub const Position = enum(c_int) {
    UNKNOWN,
    FRONT_FACING,
    BACK_FACING,
};

pub const PermissionState = enum(c_int) {
    DENIED = -1,
    PENDING,
    APPROVED,
};

extern fn SDL_GetNumCameraDrivers() c_int;
extern fn SDL_GetCameraDriver(index: c_int) ?[*:0]const u8;
extern fn SDL_GetCurrentCameraDriver() ?[*:0]const u8;
extern fn SDL_GetCameras(count: ?*c_int) ?[*]ID;
extern fn SDL_GetCameraSupportedFormats(instance_id: ID, count: ?*c_int) ?[*]?*Spec;
extern fn SDL_GetCameraName(instance_id: ID) ?[*:0]const u8;
extern fn SDL_GetCameraPosition(instance_id: ID) Position;
extern fn SDL_OpenCamera(instance_id: ID, spec: ?*const Spec) ?*Camera;
extern fn SDL_GetCameraPermissionState(camera: ?*Camera) PermissionState;
extern fn SDL_GetCameraID(camera: ?*Camera) ID;
extern fn SDL_GetCameraProperties(camera: ?*Camera) props.ID;
extern fn SDL_GetCameraFormat(camera: ?*Camera, spec: ?*Spec) bool;
extern fn SDL_AcquireCameraFrame(camera: ?*Camera, timestamp: ?*u64) ?*surface.Surface;
extern fn SDL_ReleaseCameraFrame(camera: ?*Camera, frame: ?*surface.Surface) void;
extern fn SDL_CloseCamera(camera: ?*Camera) void;

// Public API
pub const getNumDrivers = SDL_GetNumCameraDrivers;
pub const getDriver = SDL_GetCameraDriver;
pub const getCurrentDriver = SDL_GetCurrentCameraDriver;
pub const gets = SDL_GetCameras;
pub const getSupportedFormats = SDL_GetCameraSupportedFormats;
pub const getName = SDL_GetCameraName;
pub const getPosition = SDL_GetCameraPosition;
pub const open = SDL_OpenCamera;
pub const getPermissionState = SDL_GetCameraPermissionState;
pub const getID = SDL_GetCameraID;
pub const getProps = SDL_GetCameraProperties;
pub const getFormat = SDL_GetCameraFormat;
pub const acquireFrame = SDL_AcquireCameraFrame;
pub const releaseFrame = SDL_ReleaseCameraFrame;
pub const close = SDL_CloseCamera;
