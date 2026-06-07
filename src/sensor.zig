// SDL3 Sensor Bindings
// Accelerometer and gyroscope input

const core = @import("core.zig");
const props = @import("props.zig");

pub const ID = u32;

// Sensor types
pub const Type = enum(c_int) {
    INVALID = -1,
    UNKNOWN,
    ACCEL,
    GYRO,
    ACCEL_L,
    GYRO_L,
    ACCEL_R,
    GYRO_R,
};

// Sensor handle
pub const Sensor = opaque {};

// Sensor functions
extern fn SDL_GetSensors(count: ?*c_int) ?[*]ID;
extern fn SDL_GetSensorNameForID(instance_id: ID) ?[*:0]const u8;
extern fn SDL_GetSensorTypeForID(instance_id: ID) Type;
extern fn SDL_GetSensorNonPortableTypeForID(instance_id: ID) c_int;
extern fn SDL_OpenSensor(instance_id: ID) ?*Sensor;
extern fn SDL_GetSensorFromID(instance_id: ID) ?*Sensor;
extern fn SDL_GetSensorID(sensor: ?*Sensor) ID;
extern fn SDL_GetSensorName(sensor: ?*Sensor) ?[*:0]const u8;
extern fn SDL_GetSensorType(sensor: ?*Sensor) Type;
extern fn SDL_GetSensorNonPortableType(sensor: ?*Sensor) c_int;
extern fn SDL_IsSensorEnabled(sensor: ?*Sensor) bool;
extern fn SDL_GetSensorData(sensor: ?*Sensor, data: ?[*]f32, num_values: c_int) bool;
extern fn SDL_GetSensorProperties(sensor: ?*Sensor) props.ID;
extern fn SDL_SetSensorEnabled(sensor: ?*Sensor, enabled: bool) bool;
extern fn SDL_CloseSensor(sensor: ?*Sensor) void;
extern fn SDL_UpdateSensors() void;

// Public API
pub const get = SDL_GetSensors;
pub const getNameForID = SDL_GetSensorNameForID;
pub const getTypeForID = SDL_GetSensorTypeForID;
pub const getNonPortableTypeForID = SDL_GetSensorNonPortableTypeForID;
pub const open = SDL_OpenSensor;
pub const getFromID = SDL_GetSensorFromID;
pub const getID = SDL_GetSensorID;
pub const getName = SDL_GetSensorName;
pub const getType = SDL_GetSensorType;
pub const getNonPortableType = SDL_GetSensorNonPortableType;
pub const isEnabled = SDL_IsSensorEnabled;
pub const getData = SDL_GetSensorData;
pub const getProps = SDL_GetSensorProperties;
pub const setEnabled = SDL_SetSensorEnabled;
pub const close = SDL_CloseSensor;
pub const update = SDL_UpdateSensors;
