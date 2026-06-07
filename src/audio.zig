// SDL3 Audio Bindings
// Playback, recording, mixing

const props = @import("props.zig");
pub const ID = u32;

// Audio format (matches SDL_AudioFormat in SDL3)
pub const Format = c_uint;

// Audio device constants
pub const AUDIO_DEVICE_DEFAULT_PLAYBACK: ID = 0xFFFFFFFF;
pub const AUDIO_DEVICE_DEFAULT_RECORDING: ID = 0xFFFFFFFE;

pub const AUDIO_UNKNOWN: Format = 0x0000;
pub const AUDIO_U8: Format = 0x0008;
pub const AUDIO_S8: Format = 0x8008;
pub const AUDIO_S16LE: Format = 0x8010;
pub const AUDIO_S16BE: Format = 0x9010;
pub const AUDIO_S32LE: Format = 0x8020;
pub const AUDIO_S32BE: Format = 0x9020;
pub const AUDIO_F32LE: Format = 0x8120;
pub const AUDIO_F32BE: Format = 0x9120;

// Audio structs
pub const Spec = extern struct {
    format: Format,
    channels: c_int,
    freq: c_int,
};

pub const Stream = opaque {};

// Audio functions
extern fn SDL_OpenAudioDevice(devid: ID, spec: ?*const Spec) ID;
extern fn SDL_CloseAudioDevice(devid: ID) void;
extern fn SDL_PauseAudioDevice(devid: ID) bool;
extern fn SDL_GetAudioDeviceName(devid: ID) ?[*:0]const u8;
extern fn SDL_GetNumAudioDrivers() c_int;
extern fn SDL_GetAudioDriver(index: c_int) ?[*:0]const u8;
extern fn SDL_GetCurrentAudioDriver() ?[*:0]const u8;
extern fn SDL_GetAudioPlaybackDevices(count: ?*c_int) ?[*]ID;
extern fn SDL_GetAudioRecordingDevices(count: ?*c_int) ?[*]ID;
extern fn SDL_GetAudioDeviceFormat(devid: ID, spec: ?*Spec, sample_frames: ?*c_int) bool;
extern fn SDL_GetAudioDeviceChannelMap(devid: ID, count: ?*c_int) ?[*]c_int;
extern fn SDL_IsAudioDevicePhysical(devid: ID) bool;
extern fn SDL_IsAudioDevicePlayback(devid: ID) bool;
extern fn SDL_ResumeAudioDevice(devid: ID) bool;
extern fn SDL_AudioDevicePaused(devid: ID) bool;
extern fn SDL_ClearAudioStream(stream: ?*Stream) bool;
extern fn SDL_CreateAudioStream(src_spec: ?*const Spec, dst_spec: ?*const Spec) ?*Stream;
extern fn SDL_DestroyAudioStream(stream: ?*Stream) void;
extern fn SDL_GetAudioStreamData(stream: ?*Stream, buf: ?*anyopaque, len: c_int) c_int;
extern fn SDL_GetAudioStreamDevice(stream: ?*Stream) ID;
extern fn SDL_GetAudioStreamFormat(stream: ?*Stream, src_spec: ?*Spec, dst_spec: ?*Spec) bool;
extern fn SDL_GetAudioStreamProperties(stream: ?*Stream) props.ID;
extern fn SDL_GetAudioStreamQueued(stream: ?*Stream) c_int;
extern fn SDL_LockAudioStream(stream: ?*Stream) bool;
extern fn SDL_OpenAudioDeviceStream(device: ID, spec: ?*const Spec, callback: ?*const fn (?*anyopaque, ?*Stream, c_int, c_int) callconv(.c) void, userdata: ?*anyopaque) ?*Stream;
extern fn SDL_PutAudioStreamData(stream: ?*Stream, buf: ?*const anyopaque, len: c_int) bool;
extern fn SDL_SetAudioStreamFormat(stream: ?*Stream, src_spec: ?*const Spec, dst_spec: ?*const Spec) bool;
extern fn SDL_SetAudioStreamGetCallback(stream: ?*Stream, callback: ?*const fn (?*anyopaque, ?*Stream, c_int, c_int) callconv(.c) void, userdata: ?*anyopaque) bool;
extern fn SDL_SetAudioStreamPutCallback(stream: ?*Stream, callback: ?*const fn (?*anyopaque, ?*Stream, c_int, c_int) callconv(.c) void, userdata: ?*anyopaque) bool;
extern fn SDL_UnlockAudioStream(stream: ?*Stream) bool;
extern fn SDL_FlushAudioStream(stream: ?*Stream) bool;
extern fn SDL_BindAudioStream(device: ID, stream: ?*Stream) bool;
extern fn SDL_BindAudioStreams(device: ID, streams: ?[*]?*Stream, num_streams: c_int) bool;
extern fn SDL_UnbindAudioStream(stream: ?*Stream) void;
extern fn SDL_UnbindAudioStreams(streams: ?[*]?*Stream, num_streams: c_int) void;
extern fn SDL_ConvertAudioSamples(src_spec: ?*const Spec, src_data: ?*const u8, src_len: c_int, dst_spec: ?*const Spec, dst_data: ?*?*u8, dst_len: ?*c_int) bool;
extern fn SDL_GetAudioFormatName(format: Format) ?[*:0]const u8;
extern fn SDL_GetSilenceValueForFormat(format: Format) c_int;
extern fn SDL_MixAudio(dst: ?[*]u8, src: ?[*]const u8, format: Format, len: u32, volume: f32) bool;

// Additional SDL3 audio APIs
extern fn SDL_GetAudioStreamGain(stream: ?*Stream) f32;
extern fn SDL_SetAudioStreamGain(stream: ?*Stream, gain: f32) bool;

const fs = @import("fs.zig");
const IOStream = fs.IOStream;
extern fn SDL_LoadWAV_IO(src: ?*IOStream, closeio: bool, spec: ?*Spec, audio_buf: ?*?*u8, audio_len: ?*u32) bool;
extern fn SDL_LoadWAV(path: [*:0]const u8, spec: ?*Spec, audio_buf: ?*?*u8, audio_len: ?*u32) bool;

// Additional audio functions
extern fn SDL_GetAudioDeviceGain(devid: ID) f32;
extern fn SDL_SetAudioDeviceGain(devid: ID, gain: f32) bool;
extern fn SDL_GetAudioStreamFrequencyRatio(stream: ?*Stream) f32;
extern fn SDL_SetAudioStreamFrequencyRatio(stream: ?*Stream, ratio: f32) bool;
extern fn SDL_GetAudioStreamInputChannelMap(stream: ?*Stream, count: ?*c_int) ?[*]c_int;
extern fn SDL_GetAudioStreamOutputChannelMap(stream: ?*Stream, count: ?*c_int) ?[*]c_int;
extern fn SDL_SetAudioStreamInputChannelMap(stream: ?*Stream, chmap: ?[*]const c_int, count: c_int) bool;
extern fn SDL_SetAudioStreamOutputChannelMap(stream: ?*Stream, chmap: ?[*]const c_int, count: c_int) bool;
extern fn SDL_GetAudioStreamAvailable(stream: ?*Stream) c_int;
extern fn SDL_PauseAudioStreamDevice(stream: ?*Stream) bool;
extern fn SDL_ResumeAudioStreamDevice(stream: ?*Stream) bool;
extern fn SDL_AudioStreamDevicePaused(stream: ?*Stream) bool;

// Public API
pub const open = SDL_OpenAudioDevice;
pub const close = SDL_CloseAudioDevice;
pub const pause = SDL_PauseAudioDevice;
pub const getName = SDL_GetAudioDeviceName;
pub const getNumDrivers = SDL_GetNumAudioDrivers;
pub const getDriver = SDL_GetAudioDriver;
pub const getCurrentDriver = SDL_GetCurrentAudioDriver;
pub const getPlaybackDevices = SDL_GetAudioPlaybackDevices;
pub const getRecordingDevices = SDL_GetAudioRecordingDevices;
pub const getFormat = SDL_GetAudioDeviceFormat;
pub const getChannelMap = SDL_GetAudioDeviceChannelMap;
pub const isPhysical = SDL_IsAudioDevicePhysical;
pub const isPlayback = SDL_IsAudioDevicePlayback;
pub const resumeDevice = SDL_ResumeAudioDevice;
pub const isPaused = SDL_AudioDevicePaused;
pub const createStream = SDL_CreateAudioStream;
pub const destroyStream = SDL_DestroyAudioStream;
pub const clearStream = SDL_ClearAudioStream;
pub const getStreamData = SDL_GetAudioStreamData;
pub const getStreamDevice = SDL_GetAudioStreamDevice;
pub const getStreamFormat = SDL_GetAudioStreamFormat;
pub const getStreamProps = SDL_GetAudioStreamProperties;
pub const getStreamQueued = SDL_GetAudioStreamQueued;
pub const lockStream = SDL_LockAudioStream;
pub const openStream = SDL_OpenAudioDeviceStream;
pub const putStreamData = SDL_PutAudioStreamData;
pub const setStreamFormat = SDL_SetAudioStreamFormat;
pub const setStreamGetCallback = SDL_SetAudioStreamGetCallback;
pub const setStreamPutCallback = SDL_SetAudioStreamPutCallback;
pub const unlockStream = SDL_UnlockAudioStream;
pub const flushStream = SDL_FlushAudioStream;
pub const bindStream = SDL_BindAudioStream;
pub const bindStreams = SDL_BindAudioStreams;
pub const unbindStream = SDL_UnbindAudioStream;
pub const unbindStreams = SDL_UnbindAudioStreams;
pub const convertSamples = SDL_ConvertAudioSamples;
pub const getFormatName = SDL_GetAudioFormatName;
pub const getSilenceValueForFormat = SDL_GetSilenceValueForFormat;
pub const mix = SDL_MixAudio;
pub const getStreamGain = SDL_GetAudioStreamGain;
pub const setStreamGain = SDL_SetAudioStreamGain;
pub const loadWAV_IO = SDL_LoadWAV_IO;
pub const loadWAV = SDL_LoadWAV;
pub const getGain = SDL_GetAudioDeviceGain;
pub const setGain = SDL_SetAudioDeviceGain;
pub const getStreamFrequencyRatio = SDL_GetAudioStreamFrequencyRatio;
pub const setStreamFrequencyRatio = SDL_SetAudioStreamFrequencyRatio;
pub const getStreamInputChannelMap = SDL_GetAudioStreamInputChannelMap;
pub const getStreamOutputChannelMap = SDL_GetAudioStreamOutputChannelMap;
pub const setStreamInputChannelMap = SDL_SetAudioStreamInputChannelMap;
pub const setStreamOutputChannelMap = SDL_SetAudioStreamOutputChannelMap;
pub const getStreamAvailable = SDL_GetAudioStreamAvailable;
pub const pauseStreamDevice = SDL_PauseAudioStreamDevice;
pub const resumeStreamDevice = SDL_ResumeAudioStreamDevice;
pub const isStreamDevicePaused = SDL_AudioStreamDevicePaused;
