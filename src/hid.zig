// SDL3 HIDAPI Bindings
// HID device access

// Placeholder for c_wchar_t
pub const c_wchar_t = u16;

// HID structs
pub const Device = opaque {};

// HID functions
extern fn SDL_hid_init() c_int;
extern fn SDL_hid_exit() c_int;
extern fn SDL_hid_device_change_count() u32;
extern fn SDL_hid_enumerate(vendor_id: u16, product_id: u16) ?*DeviceInfo;
extern fn SDL_hid_free_enumeration(devs: ?*DeviceInfo) void;
extern fn SDL_hid_open(vendor_id: u16, product_id: u16, serial_number: ?*const c_wchar_t) ?*Device;
extern fn SDL_hid_open_path(path: ?[*:0]const u8) ?*Device;
extern fn SDL_hid_write(dev: ?*Device, data: ?*const u8, length: usize) c_int;
extern fn SDL_hid_read_timeout(dev: ?*Device, data: ?*u8, length: usize, milliseconds: c_int) c_int;
extern fn SDL_hid_read(dev: ?*Device, data: ?*u8, length: usize) c_int;
extern fn SDL_hid_set_nonblocking(dev: ?*Device, nonblock: c_int) c_int;
extern fn SDL_hid_send_feature_report(dev: ?*Device, data: ?*const u8, length: usize) c_int;
extern fn SDL_hid_get_feature_report(dev: ?*Device, data: ?*u8, length: usize) c_int;
extern fn SDL_hid_close(dev: ?*Device) void;
extern fn SDL_hid_get_manufacturer_string(dev: ?*Device, string: ?*c_wchar_t, maxlen: usize) c_int;
extern fn SDL_hid_get_product_string(dev: ?*Device, string: ?*c_wchar_t, maxlen: usize) c_int;
extern fn SDL_hid_get_serial_number_string(dev: ?*Device, string: ?*c_wchar_t, maxlen: usize) c_int;
extern fn SDL_hid_get_indexed_string(dev: ?*Device, string_index: c_int, string: ?*c_wchar_t, maxlen: usize) c_int;
extern fn SDL_hid_ble_scan(scan: bool) void;

// HID device info struct
pub const DeviceInfo = extern struct {
    path: ?[*:0]const u8,
    vendor_id: u16,
    product_id: u16,
    serial_number: ?*const c_wchar_t,
    release_number: u16,
    manufacturer_string: ?*const c_wchar_t,
    product_string: ?*const c_wchar_t,
    usage_page: u16,
    usage: u16,
    interface_number: c_int,
    interface_class: c_int,
    interface_subclass: c_int,
    interface_protocol: c_int,
    next: ?*DeviceInfo,
};

// Public API
pub const hidInit = SDL_hid_init;
pub const hidExit = SDL_hid_exit;
pub const hidDeviceChangeCount = SDL_hid_device_change_count;
pub const hidEnumerate = SDL_hid_enumerate;
pub const hidFreeEnumeration = SDL_hid_free_enumeration;
pub const hidOpen = SDL_hid_open;
pub const hidOpenPath = SDL_hid_open_path;
pub const hidWrite = SDL_hid_write;
pub const hidReadTimeout = SDL_hid_read_timeout;
pub const hidRead = SDL_hid_read;
pub const hidSetNonblocking = SDL_hid_set_nonblocking;
pub const hidSendFeatureReport = SDL_hid_send_feature_report;
pub const hidGetFeatureReport = SDL_hid_get_feature_report;
pub const hidClose = SDL_hid_close;
pub const hidGetManufacturerString = SDL_hid_get_manufacturer_string;
pub const hidGetProductString = SDL_hid_get_product_string;
pub const hidGetSerialNumberString = SDL_hid_get_serial_number_string;
pub const hidGetIndexedString = SDL_hid_get_indexed_string;
pub const hidBleScan = SDL_hid_ble_scan;
