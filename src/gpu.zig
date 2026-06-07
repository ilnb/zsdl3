// SDL3 GPU Bindings
// 3D rendering and compute

pub const ShaderFormat = u32;
pub const BufferUsageFlags = u32;
pub const TextureUsageFlags = u32;
pub const ColorComponentFlags = u8;
const pixels = @import("pixels.zig");
const props = @import("props.zig");
const Rect = pixels.Rect;
const render = @import("render.zig");
const FColor = render.FColor;
const video = @import("video.zig");

// Opaque structs
pub const Device = opaque {};
pub const Buffer = opaque {};
pub const TransferBuffer = opaque {};
pub const Texture = opaque {};
pub const Sampler = opaque {};
pub const Shader = opaque {};
pub const ComputePipeline = opaque {};
pub const GraphicsPipeline = opaque {};
pub const CommandBuffer = opaque {};
pub const RenderPass = opaque {};
pub const ComputePass = opaque {};
pub const CopyPass = opaque {};
pub const Fence = opaque {};

// Enums
pub const PrimitiveType = enum(c_int) {
    TRIANGLELIST,
    TRIANGLESTRIP,
    LINELIST,
    LINESTRIP,
    POINTLIST,
};

pub const LoadOp = enum(c_int) {
    LOAD,
    CLEAR,
    DONT_CARE,
};

pub const StoreOp = enum(c_int) {
    STORE,
    DONT_CARE,
    RESOLVE,
    RESOLVE_AND_STORE,
};

pub const IndexElementSize = enum(c_int) {
    SIZE_16BIT,
    SIZE_32BIT,
};

pub const PresentMode = enum(c_int) {
    VSYNC,
    IMMEDIATE,
    MAILBOX,
};

pub const SwapchainComposition = enum(c_int) {
    SDR,
    SDR_LINEAR,
    HDR_EXTENDED_LINEAR,
    HDR10_ST2084,
};

// GPU driver functions
extern fn SDL_GetNumGPUDrivers() c_int;
extern fn SDL_GetGPUDriver(index: c_int) ?[*:0]const u8;
extern fn SDL_GetGPUDeviceDriver(device: ?*Device) ?[*:0]const u8;

// Basic functions
extern fn SDL_CreateGPUDevice(shader_formats: ShaderFormat, debug_mode: bool, name: ?[*:0]const u8) ?*Device;
extern fn SDL_CreateGPUDeviceWithProperties(props: props.ID) ?*Device;
extern fn SDL_DestroyGPUDevice(device: ?*Device) void;
extern fn SDL_GetGPUShaderFormats(device: ?*Device) ShaderFormat;
extern fn SDL_ClaimWindowForGPUDevice(device: ?*Device, window: ?*video.WindowType) bool;
extern fn SDL_ReleaseWindowFromGPUDevice(device: ?*Device, window: ?*video.WindowType) void;
extern fn SDL_AcquireGPUSwapchainTexture(command_buffer: ?*CommandBuffer, window: ?*video.WindowType, swapchain_texture: ?*?*Texture, swapchain_texture_width: ?*u32, swapchain_texture_height: ?*u32) bool;
extern fn SDL_WaitForGPUSwapchain(device: ?*Device, window: ?*video.WindowType) bool;
extern fn SDL_WaitAndAcquireGPUSwapchainTexture(command_buffer: ?*CommandBuffer, window: ?*video.WindowType, swapchain_texture: ?*?*Texture, swapchain_texture_width: ?*u32, swapchain_texture_height: ?*u32) bool;
extern fn SDL_AcquireGPUCommandBuffer(device: ?*Device) ?*CommandBuffer;
extern fn SDL_SubmitGPUCommandBuffer(command_buffer: ?*CommandBuffer) bool;
extern fn SDL_SubmitGPUCommandBufferAndAcquireFence(command_buffer: ?*CommandBuffer) ?*Fence;
extern fn SDL_CancelGPUCommandBuffer(command_buffer: ?*CommandBuffer) bool;
extern fn SDL_QueryGPUFence(device: ?*Device, fence: ?*Fence) bool;
extern fn SDL_WaitForGPUFences(device: ?*Device, wait_all: bool, fences: ?[*]?*Fence, num_fences: u32) bool;
extern fn SDL_ReleaseGPUFence(device: ?*Device, fence: ?*Fence) void;

// GPU structs
pub const BufferCreateInfo = extern struct {
    usage: BufferUsageFlags,
    size: u32,
    props: props.ID,
};

pub const BUFFERUSAGE_VERTEX = 1 << 0;
pub const BUFFERUSAGE_INDEX = 1 << 1;
pub const BUFFERUSAGE_INDIRECT = 1 << 2;
pub const BUFFERUSAGE_GRAPHICS_STORAGE_READ = 1 << 3;
pub const BUFFERUSAGE_COMPUTE_STORAGE_READ = 1 << 4;
pub const BUFFERUSAGE_COMPUTE_STORAGE_WRITE = 1 << 5;

pub const TextureCreateInfo = extern struct {
    type: TextureType,
    format: TextureFormat,
    usage: TextureUsageFlags,
    width: u32,
    height: u32,
    layer_count_or_depth: u32,
    num_levels: u32,
    sample_count: SampleCount,
    props: props.ID,
};

pub const TextureType = enum(c_int) {
    TYPE_2D,
    TYPE_2D_ARRAY,
    TYPE_3D,
    TYPE_CUBE,
    TYPE_CUBE_ARRAY,
};

pub const TextureFormat = enum(c_int) {
    INVALID = 0,
    A8_UNORM,
    R8_UNORM,
    R8G8_UNORM,
    R8G8B8A8_UNORM,
    R16_UNORM,
    R16G16_UNORM,
    R16G16B16A16_UNORM,
    R10G10B10A2_UNORM,
    B5G6R5_UNORM,
    B5G5R5A1_UNORM,
    B4G4R4A4_UNORM,
    B8G8R8A8_UNORM,
    BC1_RGBA_UNORM,
    BC2_RGBA_UNORM,
    BC3_RGBA_UNORM,
    BC4_R_UNORM,
    BC5_RG_UNORM,
    BC7_RGBA_UNORM,
    BC6H_RGB_FLOAT,
    BC6H_RGB_UFLOAT,
    R8_SNORM,
    R8G8_SNORM,
    R8G8B8A8_SNORM,
    R16_SNORM,
    R16G16_SNORM,
    R16G16B16A16_SNORM,
    R16_FLOAT,
    R16G16_FLOAT,
    R16G16B16A16_FLOAT,
    R32_FLOAT,
    R32G32_FLOAT,
    R32G32B32A32_FLOAT,
    R11G11B10_UFLOAT,
    R8_UINT,
    R8G8_UINT,
    R8G8B8A8_UINT,
    R16_UINT,
    R16G16_UINT,
    R16G16B16A16_UINT,
    R32_UINT,
    R32G32_UINT,
    R32G32B32A32_UINT,
    R8_INT,
    R8G8_INT,
    R8G8B8A8_INT,
    R16_INT,
    R16G16_INT,
    R16G16B16A16_INT,
    R32_INT,
    R32G32_INT,
    R32G32B32A32_INT,
    R8G8B8A8_UNORM_SRGB,
    B8G8R8A8_UNORM_SRGB,
    BC1_RGBA_UNORM_SRGB,
    BC2_RGBA_UNORM_SRGB,
    BC3_RGBA_UNORM_SRGB,
    BC7_RGBA_UNORM_SRGB,
    D16_UNORM,
    D24_UNORM,
    D32_FLOAT,
    D24_UNORM_S8_UINT,
    D32_FLOAT_S8_UINT,
    ASTC_4x4_UNORM,
    ASTC_5x4_UNORM,
    ASTC_5x5_UNORM,
    ASTC_6x5_UNORM,
    ASTC_6x6_UNORM,
    ASTC_8x5_UNORM,
    ASTC_8x6_UNORM,
    ASTC_8x8_UNORM,
    ASTC_10x5_UNORM,
    ASTC_10x6_UNORM,
    ASTC_10x8_UNORM,
    ASTC_10x10_UNORM,
    ASTC_12x10_UNORM,
    ASTC_12x12_UNORM,
    ASTC_4x4_UNORM_SRGB,
    ASTC_5x4_UNORM_SRGB,
    ASTC_5x5_UNORM_SRGB,
    ASTC_6x5_UNORM_SRGB,
    ASTC_6x6_UNORM_SRGB,
    ASTC_8x5_UNORM_SRGB,
    ASTC_8x6_UNORM_SRGB,
    ASTC_8x8_UNORM_SRGB,
    ASTC_10x5_UNORM_SRGB,
    ASTC_10x6_UNORM_SRGB,
    ASTC_10x8_UNORM_SRGB,
    ASTC_10x10_UNORM_SRGB,
    ASTC_12x10_UNORM_SRGB,
    ASTC_12x12_UNORM_SRGB,
    ASTC_4x4_FLOAT,
    ASTC_5x4_FLOAT,
    ASTC_5x5_FLOAT,
    ASTC_6x5_FLOAT,
    ASTC_6x6_FLOAT,
    ASTC_8x5_FLOAT,
    ASTC_8x6_FLOAT,
    ASTC_8x8_FLOAT,
    ASTC_10x5_FLOAT,
    ASTC_10x6_FLOAT,
    ASTC_10x8_FLOAT,
    ASTC_10x10_FLOAT,
    ASTC_12x10_FLOAT,
    ASTC_12x12_FLOAT,
};

pub const TEXTUREUSAGE_SAMPLER = 1 << 0;
pub const TEXTUREUSAGE_COLOR_TARGET = 1 << 1;
pub const TEXTUREUSAGE_DEPTH_STENCIL_TARGET = 1 << 2;
pub const TEXTUREUSAGE_GRAPHICS_STORAGE_READ = 1 << 3;
pub const TEXTUREUSAGE_COMPUTE_STORAGE_READ = 1 << 4;
pub const TEXTUREUSAGE_COMPUTE_STORAGE_WRITE = 1 << 5;
pub const TEXTUREUSAGE_COMPUTE_STORAGE_SIMULTANEOUS_READ_WRITE = 1 << 6;

pub const SampleCount = enum(c_int) {
    COUNT_1,
    COUNT_2,
    COUNT_4,
    COUNT_8,
};

pub const SamplerCreateInfo = extern struct {
    min_filter: Filter,
    mag_filter: Filter,
    mipmap_mode: SamplerMipmapMode,
    address_mode_u: SamplerAddressMode,
    address_mode_v: SamplerAddressMode,
    address_mode_w: SamplerAddressMode,
    mip_lod_bias: f32,
    max_anisotropy: f32,
    compare_op: CompareOp,
    min_lod: f32,
    max_lod: f32,
    enable_anisotropy: bool,
    enable_compare: bool,
    padding: [2]u8,
    props: props.ID,
};

pub const Filter = enum(c_int) {
    NEAREST,
    LINEAR,
};

pub const SamplerMipmapMode = enum(c_int) {
    NEAREST,
    LINEAR,
};

pub const SamplerAddressMode = enum(c_int) {
    REPEAT,
    MIRRORED_REPEAT,
    CLAMP_TO_EDGE,
};

pub const CompareOp = enum(c_int) {
    INVALID,
    NEVER,
    LESS,
    EQUAL,
    LESS_OR_EQUAL,
    GREATER,
    NOT_EQUAL,
    GREATER_OR_EQUAL,
    ALWAYS,
};

pub const ShaderCreateInfo = extern struct {
    code_size: usize,
    code: ?[*]const u8,
    entrypoint: ?[*:0]const u8,
    format: u32,
    stage: ShaderStage,
    num_samplers: u32,
    num_storage_textures: u32,
    num_storage_buffers: u32,
    num_uniform_buffers: u32,
    props: props.ID,
};

pub const ShaderStage = enum(c_int) {
    VERTEX,
    FRAGMENT,
};

pub const TransferBufferCreateInfo = extern struct {
    usage: TransferBufferUsage,
    size: u32,
    props: props.ID,
};

pub const TransferBufferUsage = enum(c_int) {
    UPLOAD,
    DOWNLOAD,
};

pub const TextureTransferInfo = extern struct {
    transfer_buffer: ?*TransferBuffer,
    offset: u32,
    pixels_per_row: u32,
    rows_per_layer: u32,
};

pub const TransferBufferLocation = extern struct {
    transfer_buffer: ?*TransferBuffer,
    offset: u32,
};

pub const TextureLocation = extern struct {
    texture: ?*Texture,
    mip_level: u32,
    layer: u32,
    x: u32,
    y: u32,
    z: u32,
};

pub const BufferLocation = extern struct {
    buffer: ?*Buffer,
    offset: u32,
};

pub const TextureRegion = extern struct {
    texture: ?*Texture,
    mip_level: u32,
    layer: u32,
    x: u32,
    y: u32,
    z: u32,
    w: u32,
    h: u32,
    d: u32,
};

pub const BufferRegion = extern struct {
    buffer: ?*Buffer,
    offset: u32,
    size: u32,
};

pub const ColorTargetInfo = extern struct {
    texture: ?*Texture,
    mip_level: u32,
    layer_or_depth_plane: u32,
    clear_color: FColor,
    load_op: LoadOp,
    store_op: StoreOp,
    resolve_texture: ?*Texture,
    resolve_mip_level: u32,
    resolve_layer: u32,
    cycle: bool,
    cycle_resolve_texture: bool,
    padding: [2]u8,
};

pub const DepthStencilTargetInfo = extern struct {
    texture: ?*Texture,
    clear_depth: f32,
    load_op: LoadOp,
    stencil_load_op: LoadOp,
    store_op: StoreOp,
    stencil_store_op: StoreOp,
    cycle: bool,
    clear_stencil: u8,
    mip_level: u8,
    layer: u8,
};

pub const Viewport = extern struct {
    x: f32,
    y: f32,
    w: f32,
    h: f32,
    min_depth: f32,
    max_depth: f32,
};

pub const BufferBinding = extern struct {
    buffer: ?*Buffer,
    offset: u32,
};

pub const IndirectDrawCommand = extern struct {
    num_vertices: u32,
    num_instances: u32,
    first_vertex: u32,
    first_instance: u32,
};

pub const IndexedIndirectDrawCommand = extern struct {
    num_indices: u32,
    num_instances: u32,
    first_index: u32,
    vertex_offset: i32,
    first_instance: u32,
};

pub const IndirectDispatchCommand = extern struct {
    group_count_x: u32,
    group_count_y: u32,
    group_count_z: u32,
};

// Additional structs
pub const GraphicsPipelineCreateInfo = extern struct {
    vertex_shader: ?*Shader,
    fragment_shader: ?*Shader,
    vertex_input_state: VertexInputState,
    primitive_type: PrimitiveType,
    rasterizer_state: RasterizerState,
    multisample_state: MultisampleState,
    depth_stencil_state: DepthStencilState,
    target_info: GraphicsPipelineTargetInfo,
    props: props.ID,
};

pub const VertexInputState = extern struct {
    vertex_buffer_descriptions: ?[*]VertexBufferDescription,
    num_vertex_buffers: u32,
    vertex_attributes: ?[*]VertexAttribute,
    num_vertex_attributes: u32,
};

pub const VertexBufferDescription = extern struct {
    slot: u32,
    pitch: u32,
    input_rate: VertexInputRate,
    instance_step_rate: u32,
};

pub const VertexInputRate = enum(c_int) {
    VERTEX,
    INSTANCE,
};

pub const VertexAttribute = extern struct {
    location: u32,
    buffer_slot: u32,
    format: VertexElementFormat,
    offset: u32,
};

pub const VertexElementFormat = enum(c_int) {
    INVALID,
    INT,
    INT2,
    INT3,
    INT4,
    UINT,
    UINT2,
    UINT3,
    UINT4,
    FLOAT,
    FLOAT2,
    FLOAT3,
    FLOAT4,
    BYTE2,
    BYTE4,
    BYTE2_NORM,
    BYTE4_NORM,
    UBYTE2,
    UBYTE4,
    UBYTE2_NORM,
    UBYTE4_NORM,
    SHORT2,
    SHORT4,
    SHORT2_NORM,
    SHORT4_NORM,
    USHORT2,
    USHORT4,
    USHORT2_NORM,
    USHORT4_NORM,
    HALF2,
    HALF4,
};

pub const RasterizerState = extern struct {
    fill_mode: FillMode,
    cull_mode: CullMode,
    front_face: FrontFace,
    depth_bias_constant_factor: f32,
    depth_bias_clamp: f32,
    depth_bias_slope_factor: f32,
    enable_depth_bias: bool,
    enable_depth_clip: bool,
    padding: [2]u8,
};

pub const FillMode = enum(c_int) {
    FILL,
    LINE,
};

pub const CullMode = enum(c_int) {
    NONE,
    FRONT,
    BACK,
};

pub const FrontFace = enum(c_int) {
    COUNTER_CLOCKWISE,
    CLOCKWISE,
};

pub const MultisampleState = extern struct {
    sample_count: SampleCount,
    sample_mask: u32,
    enable_mask: bool,
    enable_alpha_to_coverage: bool,
    padding: [2]u8,
};

pub const DepthStencilState = extern struct {
    compare_op: CompareOp,
    back_stencil_state: StencilOpState,
    front_stencil_state: StencilOpState,
    compare_mask: u8,
    write_mask: u8,
    enable_depth_test: bool,
    enable_depth_write: bool,
    enable_stencil_test: bool,
    padding: [3]u8,
};

pub const StencilOpState = extern struct {
    fail_op: StencilOp,
    pass_op: StencilOp,
    depth_fail_op: StencilOp,
    compare_op: CompareOp,
};

pub const StencilOp = enum(c_int) {
    INVALID,
    KEEP,
    ZERO,
    REPLACE,
    INCREMENT_AND_CLAMP,
    DECREMENT_AND_CLAMP,
    INVERT,
    INCREMENT_AND_WRAP,
    DECREMENT_AND_WRAP,
};

pub const GraphicsPipelineTargetInfo = extern struct {
    color_target_descriptions: ?[*]ColorTargetDescription,
    num_color_targets: u32,
    depth_stencil_format: TextureFormat,
    has_depth_stencil_target: bool,
    padding: [3]u8,
};

pub const ColorTargetDescription = extern struct {
    format: TextureFormat,
    blend_state: ColorTargetBlendState,
};

pub const ColorTargetBlendState = extern struct {
    src_color_blendfactor: BlendFactor,
    dst_color_blendfactor: BlendFactor,
    color_blend_op: BlendOp,
    src_alpha_blendfactor: BlendFactor,
    dst_alpha_blendfactor: BlendFactor,
    alpha_blend_op: BlendOp,
    color_write_mask: ColorComponentFlags,
    enable_blend: bool,
    enable_color_write_mask: bool,
    padding: [2]u8,
};

pub const BlendFactor = enum(c_int) {
    INVALID,
    ZERO,
    ONE,
    SRC_COLOR,
    ONE_MINUS_SRC_COLOR,
    DST_COLOR,
    ONE_MINUS_DST_COLOR,
    SRC_ALPHA,
    ONE_MINUS_SRC_ALPHA,
    DST_ALPHA,
    ONE_MINUS_DST_ALPHA,
    CONSTANT_COLOR,
    ONE_MINUS_CONSTANT_COLOR,
    SRC_ALPHA_SATURATE,
};

pub const BlendOp = enum(c_int) {
    INVALID,
    ADD,
    SUBTRACT,
    REVERSE_SUBTRACT,
    MIN,
    MAX,
};

pub const COLORCOMPONENT_R = 1 << 0;
pub const COLORCOMPONENT_G = 1 << 1;
pub const COLORCOMPONENT_B = 1 << 2;
pub const COLORCOMPONENT_A = 1 << 3;

pub const ComputePipelineCreateInfo = extern struct {
    code_size: usize,
    code: ?[*]const u8,
    entrypoint: ?[*:0]const u8,
    format: ShaderFormat,
    num_samplers: u32,
    num_readonly_storage_textures: u32,
    num_readonly_storage_buffers: u32,
    num_readwrite_storage_textures: u32,
    num_readwrite_storage_buffers: u32,
    num_uniform_buffers: u32,
    thread_count_x: u32,
    thread_count_y: u32,
    thread_count_z: u32,
    props: props.ID,
};

pub const BlitRegion = extern struct {
    texture: ?*Texture,
    mip_level: u32,
    layer_or_depth_plane: u32,
    x: u32,
    y: u32,
    w: u32,
    h: u32,
};

pub const BlitInfo = extern struct {
    source: BlitRegion,
    destination: BlitRegion,
    load_op: LoadOp,
    clear_color: FColor,
    flip_mode: FlipMode,
    filter: Filter,
    cycle: bool,
    padding: [3]u8,
};

pub const FlipMode = enum(c_int) {
    NONE,
    HORIZONTAL,
    VERTICAL,
    BOTH,
};

pub const StorageTextureReadWriteBinding = extern struct {
    texture: ?*Texture,
    mip_level: u32,
    layer: u32,
    cycle: bool,
    padding: [3]u8,
};

pub const StorageBufferReadWriteBinding = extern struct {
    buffer: ?*Buffer,
    cycle: bool,
    padding: [3]u8,
};

pub const TextureSamplerBinding = extern struct {
    texture: ?*Texture,
    sampler: ?*Sampler,
};

pub const VulkanOptions = extern struct {
    vulkan_api_version: u32,
    feature_list: ?*anyopaque,
    vulkan_10_physical_device_features: ?*anyopaque,
    device_extension_count: u32,
    device_extension_names: ?[*]?[*]const u8,
    instance_extension_count: u32,
    instance_extension_names: ?[*]?[*]const u8,
};

// Buffer functions
extern fn SDL_CreateGPUBuffer(device: ?*Device, create_info: ?*const BufferCreateInfo) ?*Buffer;
extern fn SDL_SetGPUBufferName(device: ?*Device, buffer: ?*Buffer, text: ?[*:0]const u8) void;
extern fn SDL_ReleaseGPUBuffer(device: ?*Device, buffer: ?*Buffer) void;

// Texture functions
extern fn SDL_CreateGPUTexture(device: ?*Device, create_info: ?*const TextureCreateInfo) ?*Texture;
extern fn SDL_SetGPUTextureName(device: ?*Device, texture: ?*Texture, text: ?[*:0]const u8) void;
extern fn SDL_ReleaseGPUTexture(device: ?*Device, texture: ?*Texture) void;

// Sampler functions
extern fn SDL_CreateGPUSampler(device: ?*Device, create_info: ?*const SamplerCreateInfo) ?*Sampler;
extern fn SDL_ReleaseGPUSampler(device: ?*Device, sampler: ?*Sampler) void;

// Shader functions
extern fn SDL_CreateGPUShader(device: ?*Device, create_info: ?*const ShaderCreateInfo) ?*Shader;
extern fn SDL_ReleaseGPUShader(device: ?*Device, shader: ?*Shader) void;

// Transfer buffer functions
extern fn SDL_CreateGPUTransferBuffer(device: ?*Device, create_info: ?*const TransferBufferCreateInfo) ?*TransferBuffer;
extern fn SDL_MapGPUTransferBuffer(device: ?*Device, transfer_buffer: ?*TransferBuffer, cycle: bool) ?*anyopaque;
extern fn SDL_UnmapGPUTransferBuffer(device: ?*Device, transfer_buffer: ?*TransferBuffer) void;
extern fn SDL_ReleaseGPUTransferBuffer(device: ?*Device, transfer_buffer: ?*TransferBuffer) void;

// Upload/Download functions
extern fn SDL_BeginGPUCopyPass(cmdbuf: ?*CommandBuffer) ?*CopyPass;
extern fn SDL_UploadToGPUTexture(copy_pass: ?*CopyPass, source: ?*const TextureTransferInfo, destination: ?*const TextureRegion, cycle: bool) void;
extern fn SDL_UploadToGPUBuffer(copy_pass: ?*CopyPass, source: ?*const TransferBufferLocation, destination: ?*const BufferRegion, cycle: bool) void;
extern fn SDL_DownloadFromGPUTexture(copy_pass: ?*CopyPass, source: ?*const TextureRegion, destination: ?*const TextureTransferInfo) void;
extern fn SDL_DownloadFromGPUBuffer(copy_pass: ?*CopyPass, source: ?*const BufferRegion, destination: ?*const TransferBufferLocation) void;
extern fn SDL_CopyGPUTextureToTexture(copy_pass: ?*CopyPass, source: ?*const TextureLocation, destination: ?*const TextureLocation, w: u32, h: u32, d: u32, cycle: bool) void;
extern fn SDL_CopyGPUBufferToBuffer(copy_pass: ?*CopyPass, source: ?*const BufferLocation, destination: ?*const BufferLocation, size: u32, cycle: bool) void;
extern fn SDL_EndGPUCopyPass(copy_pass: ?*CopyPass) void;

// Render pass functions
extern fn SDL_BeginGPURenderPass(cmdbuf: ?*CommandBuffer, color_target_infos: ?[*]const ColorTargetInfo, num_color_targets: u32, depth_stencil_target_info: ?*const DepthStencilTargetInfo) ?*RenderPass;
extern fn SDL_BindGPUGraphicsPipeline(render_pass: ?*RenderPass, graphics_pipeline: ?*GraphicsPipeline) void;
extern fn SDL_SetGPUViewport(render_pass: ?*RenderPass, viewport: ?*const Viewport) void;
extern fn SDL_SetGPUScissor(render_pass: ?*RenderPass, scissor: ?*const Rect) void;
extern fn SDL_BindGPUVertexBuffers(render_pass: ?*RenderPass, first_slot: u32, bindings: ?[*]const BufferBinding, num_bindings: u32) void;
extern fn SDL_BindGPUIndexBuffer(render_pass: ?*RenderPass, binding: ?*const BufferBinding, index_element_size: IndexElementSize) void;
extern fn SDL_BindGPUVertexStorageBuffers(render_pass: ?*RenderPass, first_slot: u32, storage_buffers: ?[*]const ?*Buffer, num_bindings: u32) void;
extern fn SDL_BindGPUFragmentStorageBuffers(render_pass: ?*RenderPass, first_slot: u32, storage_buffers: ?[*]const ?*Buffer, num_bindings: u32) void;
extern fn SDL_DrawGPUPrimitives(render_pass: ?*RenderPass, num_vertices: u32, num_instances: u32, first_vertex: u32, first_instance: u32) void;
extern fn SDL_DrawGPUIndexedPrimitives(render_pass: ?*RenderPass, num_indices: u32, num_instances: u32, first_index: u32, vertex_offset: i32, first_instance: u32) void;
extern fn SDL_DrawGPUPrimitivesIndirect(render_pass: ?*RenderPass, buffer: ?*Buffer, offset: u32, draw_count: u32) void;
extern fn SDL_DrawGPUIndexedPrimitivesIndirect(render_pass: ?*RenderPass, buffer: ?*Buffer, offset: u32, draw_count: u32) void;
extern fn SDL_EndGPURenderPass(render_pass: ?*RenderPass) void;

// Pipeline functions
extern fn SDL_CreateGPUGraphicsPipeline(device: ?*Device, create_info: ?*const GraphicsPipelineCreateInfo) ?*GraphicsPipeline;
extern fn SDL_CreateGPUComputePipeline(device: ?*Device, create_info: ?*const ComputePipelineCreateInfo) ?*ComputePipeline;
extern fn SDL_ReleaseGPUGraphicsPipeline(device: ?*Device, graphics_pipeline: ?*GraphicsPipeline) void;
extern fn SDL_ReleaseGPUComputePipeline(device: ?*Device, compute_pipeline: ?*ComputePipeline) void;

// Compute pass functions
extern fn SDL_BeginGPUComputePass(cmdbuf: ?*CommandBuffer, storage_texture_bindings: ?[*]const StorageTextureReadWriteBinding, num_storage_texture_bindings: u32, storage_buffer_bindings: ?[*]const StorageBufferReadWriteBinding, num_storage_buffer_bindings: u32) ?*ComputePass;
extern fn SDL_BindGPUComputePipeline(compute_pass: ?*ComputePass, compute_pipeline: ?*ComputePipeline) void;
extern fn SDL_BindGPUComputeStorageTextures(compute_pass: ?*ComputePass, first_slot: u32, storage_textures: ?[*]const ?*Texture, num_bindings: u32) void;
extern fn SDL_BindGPUComputeStorageBuffers(compute_pass: ?*ComputePass, first_slot: u32, storage_buffers: ?[*]const ?*Buffer, num_bindings: u32) void;
extern fn SDL_PushGPUComputeUniformData(cmdbuf: ?*CommandBuffer, slot_index: u32, data: ?*const anyopaque, length: u32) void;
extern fn SDL_DispatchGPUCompute(compute_pass: ?*ComputePass, groupcount_x: u32, groupcount_y: u32, groupcount_z: u32) void;
extern fn SDL_DispatchGPUComputeIndirect(compute_pass: ?*ComputePass, buffer: ?*Buffer, offset: u32) void;
extern fn SDL_EndGPUComputePass(compute_pass: ?*ComputePass) void;

// Additional rendering functions
extern fn SDL_BindGPUVertexSamplers(render_pass: ?*RenderPass, first_slot: u32, texture_sampler_bindings: ?[*]const TextureSamplerBinding, num_bindings: u32) void;
extern fn SDL_BindGPUFragmentSamplers(render_pass: ?*RenderPass, first_slot: u32, texture_sampler_bindings: ?[*]const TextureSamplerBinding, num_bindings: u32) void;
extern fn SDL_BindGPUVertexStorageTextures(render_pass: ?*RenderPass, first_slot: u32, storage_textures: ?[*]const ?*Texture, num_bindings: u32) void;
extern fn SDL_BindGPUFragmentStorageTextures(render_pass: ?*RenderPass, first_slot: u32, storage_textures: ?[*]const ?*Texture, num_bindings: u32) void;
extern fn SDL_PushGPUVertexUniformData(cmdbuf: ?*CommandBuffer, slot_index: u32, data: ?*const anyopaque, length: u32) void;
extern fn SDL_PushGPUFragmentUniformData(cmdbuf: ?*CommandBuffer, slot_index: u32, data: ?*const anyopaque, length: u32) void;
extern fn SDL_BlitGPUTexture(cmdbuf: ?*CommandBuffer, info: ?*const BlitInfo) void;
extern fn SDL_GenerateMipmapsForGPUTexture(cmdbuf: ?*CommandBuffer, texture: ?*Texture) void;

// Debug functions
extern fn SDL_InsertGPUDebugLabel(cmdbuf: ?*CommandBuffer, text: ?[*:0]const u8) void;
extern fn SDL_PushGPUDebugGroup(cmdbuf: ?*CommandBuffer, name: ?[*:0]const u8) void;
extern fn SDL_PopGPUDebugGroup(cmdbuf: ?*CommandBuffer) void;
extern fn SDL_SetGPUAllowedFramesInFlight(device: ?*Device, allowed_frames_in_flight: u32) bool;
extern fn SDL_GPUSupportsShaderFormats(format_flags: ShaderFormat, name: ?[*:0]const u8) bool;
extern fn SDL_GPUSupportsProperties(props: props.ID) bool;
extern fn SDL_GPUTextureSupportsFormat(device: ?*Device, format: TextureFormat, type: TextureType, usage: TextureUsageFlags) bool;
extern fn SDL_GPUTextureFormatTexelBlockSize(format: TextureFormat) u32;
extern fn SDL_GPUTextureSupportsSampleCount(device: ?*Device, format: TextureFormat, sample_count: SampleCount) bool;
extern fn SDL_GetGPUDeviceProperties(device: ?*Device) props.ID;
extern fn SDL_SetGPUSwapchainParameters(device: ?*Device, window: ?*video.WindowType, swapchain_composition: SwapchainComposition, present_mode: PresentMode) bool;
extern fn SDL_WindowSupportsGPUSwapchainComposition(device: ?*Device, window: ?*video.WindowType, swapchain_composition: SwapchainComposition) bool;
extern fn SDL_WindowSupportsGPUPresentMode(device: ?*Device, window: ?*video.WindowType, present_mode: PresentMode) bool;
extern fn SDL_GetGPUSwapchainTextureFormat(device: ?*Device, window: ?*video.WindowType) TextureFormat;
extern fn SDL_WaitForGPUIdle(device: ?*Device) bool;
extern fn SDL_SetGPUBlendConstants(render_pass: ?*RenderPass, blend_constants: FColor) void;
extern fn SDL_SetGPUStencilReference(render_pass: ?*RenderPass, reference: u8) void;
extern fn SDL_BindGPUComputeSamplers(compute_pass: ?*ComputePass, first_slot: u32, texture_sampler_bindings: ?[*]const TextureSamplerBinding, num_bindings: u32) void;
extern fn SDL_CalculateGPUTextureFormatSize(format: TextureFormat, width: u32, height: u32, depth_or_layer_count: u32) u32;
extern fn SDL_GetPixelFormatFromGPUTextureFormat(format: TextureFormat) c_uint;
extern fn SDL_GetGPUTextureFormatFromPixelFormat(format: c_uint) TextureFormat;

// video import
// Import types
// Import types
// Shader format type
// Shader formats
pub const SHADERFORMAT_INVALID: ShaderFormat = 0;
pub const SHADERFORMAT_PRIVATE: ShaderFormat = 1 << 0;
pub const SHADERFORMAT_SPIRV: ShaderFormat = 1 << 1;
pub const SHADERFORMAT_DXBC: ShaderFormat = 1 << 2;
pub const SHADERFORMAT_DXIL: ShaderFormat = 1 << 3;
pub const SHADERFORMAT_MSL: ShaderFormat = 1 << 4;
pub const SHADERFORMAT_METALLIB: ShaderFormat = 1 << 5;

// Public API
pub const createDevice = SDL_CreateGPUDevice;
pub const createDeviceWithProps = SDL_CreateGPUDeviceWithProperties;
pub const getShaderFormats = SDL_GetGPUShaderFormats;
pub const destroyDevice = SDL_DestroyGPUDevice;
pub const claimWindowForDevice = SDL_ClaimWindowForGPUDevice;
pub const releaseWindowFromDevice = SDL_ReleaseWindowFromGPUDevice;
pub const acquireSwapchainTexture = SDL_AcquireGPUSwapchainTexture;
pub const waitForSwapchain = SDL_WaitForGPUSwapchain;
pub const waitAndAcquireSwapchainTexture = SDL_WaitAndAcquireGPUSwapchainTexture;
pub const acquireCommandBuffer = SDL_AcquireGPUCommandBuffer;
pub const submitCommandBuffer = SDL_SubmitGPUCommandBuffer;
pub const submitCommandBufferAndAcquireFence = SDL_SubmitGPUCommandBufferAndAcquireFence;
pub const cancelCommandBuffer = SDL_CancelGPUCommandBuffer;
pub const queryFence = SDL_QueryGPUFence;
pub const waitForFences = SDL_WaitForGPUFences;
pub const releaseFence = SDL_ReleaseGPUFence;
pub const createBuffer = SDL_CreateGPUBuffer;
pub const setBufferName = SDL_SetGPUBufferName;
pub const releaseBuffer = SDL_ReleaseGPUBuffer;
pub const createTexture = SDL_CreateGPUTexture;
pub const setTextureName = SDL_SetGPUTextureName;
pub const releaseTexture = SDL_ReleaseGPUTexture;
pub const createSampler = SDL_CreateGPUSampler;
pub const releaseSampler = SDL_ReleaseGPUSampler;
pub const createShader = SDL_CreateGPUShader;
pub const releaseShader = SDL_ReleaseGPUShader;
pub const createTransferBuffer = SDL_CreateGPUTransferBuffer;
pub const mapTransferBuffer = SDL_MapGPUTransferBuffer;
pub const unmapTransferBuffer = SDL_UnmapGPUTransferBuffer;
pub const releaseTransferBuffer = SDL_ReleaseGPUTransferBuffer;
pub const beginCopyPass = SDL_BeginGPUCopyPass;
pub const uploadToTexture = SDL_UploadToGPUTexture;
pub const uploadToBuffer = SDL_UploadToGPUBuffer;
pub const downloadFromTexture = SDL_DownloadFromGPUTexture;
pub const downloadFromBuffer = SDL_DownloadFromGPUBuffer;
pub const copyTextureToTexture = SDL_CopyGPUTextureToTexture;
pub const copyBufferToBuffer = SDL_CopyGPUBufferToBuffer;
pub const endCopyPass = SDL_EndGPUCopyPass;
pub const beginRenderPass = SDL_BeginGPURenderPass;
pub const bindGraphicsPipeline = SDL_BindGPUGraphicsPipeline;
pub const setViewport = SDL_SetGPUViewport;
pub const setScissor = SDL_SetGPUScissor;
pub const bindVertexBuffers = SDL_BindGPUVertexBuffers;
pub const bindIndexBuffer = SDL_BindGPUIndexBuffer;
pub const bindVertexStorageBuffers = SDL_BindGPUVertexStorageBuffers;
pub const bindFragmentStorageBuffers = SDL_BindGPUFragmentStorageBuffers;
pub const drawPrimitives = SDL_DrawGPUPrimitives;
pub const drawIndexedPrimitives = SDL_DrawGPUIndexedPrimitives;
pub const drawPrimitivesIndirect = SDL_DrawGPUPrimitivesIndirect;
pub const drawIndexedPrimitivesIndirect = SDL_DrawGPUIndexedPrimitivesIndirect;
pub const endRenderPass = SDL_EndGPURenderPass;
pub const createGraphicsPipeline = SDL_CreateGPUGraphicsPipeline;
pub const createComputePipeline = SDL_CreateGPUComputePipeline;
pub const releaseGraphicsPipeline = SDL_ReleaseGPUGraphicsPipeline;
pub const releaseComputePipeline = SDL_ReleaseGPUComputePipeline;
pub const beginComputePass = SDL_BeginGPUComputePass;
pub const bindComputePipeline = SDL_BindGPUComputePipeline;
pub const bindComputeStorageTextures = SDL_BindGPUComputeStorageTextures;
pub const bindComputeStorageBuffers = SDL_BindGPUComputeStorageBuffers;
pub const pushComputeUniformData = SDL_PushGPUComputeUniformData;
pub const dispatchCompute = SDL_DispatchGPUCompute;
pub const dispatchComputeIndirect = SDL_DispatchGPUComputeIndirect;
pub const endComputePass = SDL_EndGPUComputePass;
pub const bindVertexSamplers = SDL_BindGPUVertexSamplers;
pub const bindFragmentSamplers = SDL_BindGPUFragmentSamplers;
pub const bindVertexStorageTextures = SDL_BindGPUVertexStorageTextures;
pub const bindFragmentStorageTextures = SDL_BindGPUFragmentStorageTextures;
pub const pushVertexUniformData = SDL_PushGPUVertexUniformData;
pub const pushFragmentUniformData = SDL_PushGPUFragmentUniformData;
pub const blitTexture = SDL_BlitGPUTexture;
pub const generateMipmapsForTexture = SDL_GenerateMipmapsForGPUTexture;
pub const insertDebugLabel = SDL_InsertGPUDebugLabel;
pub const pushDebugGroup = SDL_PushGPUDebugGroup;
pub const popDebugGroup = SDL_PopGPUDebugGroup;
pub const setAllowedFramesInFlight = SDL_SetGPUAllowedFramesInFlight;
pub const gpuSupportsShaderFormats = SDL_GPUSupportsShaderFormats;
pub const supportsProps = SDL_GPUSupportsProperties;
pub const gpuTextureSupportsFormat = SDL_GPUTextureSupportsFormat;
pub const gpuTextureFormatTexelBlockSize = SDL_GPUTextureFormatTexelBlockSize;
pub const gpuTextureSupportsSampleCount = SDL_GPUTextureSupportsSampleCount;
pub const getDeviceProps = SDL_GetGPUDeviceProperties;
pub const setSwapchainParameters = SDL_SetGPUSwapchainParameters;
pub const windowSupportsSwapchainComposition = SDL_WindowSupportsGPUSwapchainComposition;
pub const windowSupportsPresentMode = SDL_WindowSupportsGPUPresentMode;
pub const getSwapchainTextureFormat = SDL_GetGPUSwapchainTextureFormat;
pub const waitForIdle = SDL_WaitForGPUIdle;
pub const setBlendConstants = SDL_SetGPUBlendConstants;
pub const setStencilReference = SDL_SetGPUStencilReference;
pub const bindComputeSamplers = SDL_BindGPUComputeSamplers;
pub const calculateTextureFormatSize = SDL_CalculateGPUTextureFormatSize;
pub const getPixelFormatFromTextureFormat = SDL_GetPixelFormatFromGPUTextureFormat;
pub const getTextureFormatFromPixelFormat = SDL_GetGPUTextureFormatFromPixelFormat;
pub const getNumDrivers = SDL_GetNumGPUDrivers;
pub const getDriver = SDL_GetGPUDriver;
pub const getDeviceDriver = SDL_GetGPUDeviceDriver;

// GPU device creation properties
pub const PROP_GPU_DEVICE_CREATE_DEBUGMODE_BOOLEAN = "SDL.gpu.device.create.debugmode";
pub const PROP_GPU_DEVICE_CREATE_PREFERLOWPOWER_BOOLEAN = "SDL.gpu.device.create.preferlowpower";
pub const PROP_GPU_DEVICE_CREATE_VERBOSE_BOOLEAN = "SDL.gpu.device.create.verbose";
pub const PROP_GPU_DEVICE_CREATE_NAME_STRING = "SDL.gpu.device.create.name";
pub const PROP_GPU_DEVICE_CREATE_FEATURE_CLIP_DISTANCE_BOOLEAN = "SDL.gpu.device.create.feature.clip_distance";
pub const PROP_GPU_DEVICE_CREATE_FEATURE_DEPTH_CLAMPING_BOOLEAN = "SDL.gpu.device.create.feature.depth_clamping";
pub const PROP_GPU_DEVICE_CREATE_FEATURE_INDIRECT_DRAW_FIRST_INSTANCE_BOOLEAN = "SDL.gpu.device.create.feature.indirect_draw_first_instance";
pub const PROP_GPU_DEVICE_CREATE_FEATURE_ANISOTROPY_BOOLEAN = "SDL.gpu.device.create.feature.anisotropy";
pub const PROP_GPU_DEVICE_CREATE_SHADERS_PRIVATE_BOOLEAN = "SDL.gpu.device.create.shaders.private";
pub const PROP_GPU_DEVICE_CREATE_SHADERS_SPIRV_BOOLEAN = "SDL.gpu.device.create.shaders.spirv";
pub const PROP_GPU_DEVICE_CREATE_SHADERS_DXBC_BOOLEAN = "SDL.gpu.device.create.shaders.dxbc";
pub const PROP_GPU_DEVICE_CREATE_SHADERS_DXIL_BOOLEAN = "SDL.gpu.device.create.shaders.dxil";
pub const PROP_GPU_DEVICE_CREATE_SHADERS_MSL_BOOLEAN = "SDL.gpu.device.create.shaders.msl";
pub const PROP_GPU_DEVICE_CREATE_SHADERS_METALLIB_BOOLEAN = "SDL.gpu.device.create.shaders.metallib";
pub const PROP_GPU_DEVICE_CREATE_D3D12_ALLOW_FEWER_RESOURCE_SLOTS_BOOLEAN = "SDL.gpu.device.create.d3d12.allowtier1resourcebinding";
pub const PROP_GPU_DEVICE_CREATE_D3D12_SEMANTIC_NAME_STRING = "SDL.gpu.device.create.d3d12.semantic";
pub const PROP_GPU_DEVICE_CREATE_VULKAN_REQUIRE_HARDWARE_ACCELERATION_BOOLEAN = "SDL.gpu.device.create.vulkan.requirehardwareacceleration";
pub const PROP_GPU_DEVICE_CREATE_VULKAN_OPTIONS_POINTER = "SDL.gpu.device.create.vulkan.options";
pub const PROP_GPU_DEVICE_CREATE_METAL_ALLOW_MACFAMILY1_BOOLEAN = "SDL.gpu.device.create.metal.allowmacfamily1";
pub const PROP_GPU_DEVICE_CREATE_D3D12_AGILITY_SDK_VERSION_NUMBER = "SDL.gpu.device.create.d3d12.agility_sdk_version";
pub const PROP_GPU_DEVICE_CREATE_D3D12_AGILITY_SDK_PATH_STRING = "SDL.gpu.device.create.d3d12.agility_sdk_path";

// GPU device properties
pub const PROP_GPU_DEVICE_NAME_STRING = "SDL.gpu.device.name";
pub const PROP_GPU_DEVICE_DRIVER_NAME_STRING = "SDL.gpu.device.driver_name";
pub const PROP_GPU_DEVICE_DRIVER_VERSION_STRING = "SDL.gpu.device.driver_version";
pub const PROP_GPU_DEVICE_DRIVER_INFO_STRING = "SDL.gpu.device.driver_info";

// GPU shader creation properties
pub const PROP_GPU_SHADER_CREATE_NAME_STRING = "SDL.gpu.shader.create.name";

// GPU texture creation properties
pub const PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_R_FLOAT = "SDL.gpu.texture.create.d3d12.clear.r";
pub const PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_G_FLOAT = "SDL.gpu.texture.create.d3d12.clear.g";
pub const PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_B_FLOAT = "SDL.gpu.texture.create.d3d12.clear.b";
pub const PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_A_FLOAT = "SDL.gpu.texture.create.d3d12.clear.a";
pub const PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_DEPTH_FLOAT = "SDL.gpu.texture.create.d3d12.clear.depth";
pub const PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_STENCIL_NUMBER = "SDL.gpu.texture.create.d3d12.clear.stencil";
pub const PROP_GPU_TEXTURE_CREATE_NAME_STRING = "SDL.gpu.texture.create.name";

// GPU buffer creation properties
pub const PROP_GPU_BUFFER_CREATE_NAME_STRING = "SDL.gpu.buffer.create.name";

// GPU transfer buffer creation properties
pub const PROP_GPU_TRANSFERBUFFER_CREATE_NAME_STRING = "SDL.gpu.transferbuffer.create.name";

// GPU compute pipeline creation properties
pub const PROP_GPU_COMPUTEPIPELINE_CREATE_NAME_STRING = "SDL.gpu.computepipeline.create.name";

// GPU graphics pipeline creation properties
pub const PROP_GPU_GRAPHICSPIPELINE_CREATE_NAME_STRING = "SDL.gpu.graphicspipeline.create.name";

// GPU sampler creation properties
pub const PROP_GPU_SAMPLER_CREATE_NAME_STRING = "SDL.gpu.sampler.create.name";
