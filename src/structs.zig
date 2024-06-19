const ray = @cImport(@cInclude("raylib.h"));
const e = @import("enums.zig");
const PixelFormat = e.PixelFormat;
/// Vector with 2 (x, y) components
pub const Vector2 = @Vector(2, f32);

/// Vector with 3 (x, y, z) components
pub const Vector3 = @Vector(3, f32);

/// Vector with 4 (x, y, z, w) components
pub const Vector4 = @Vector(4, f32);

pub const Quaternion = Vector4;

// Matrix, 4x4 components, column major, OpenGL style, right-handed
pub const Matrix = extern struct {
    /// Matrix first row
    m0: f32,
    /// Matrix first row
    m4: f32,
    /// Matrix first row
    m8: f32,
    /// Matrix first row
    m12: f32,
    /// Matrix second row
    m1: f32,
    /// Matrix second row
    m5: f32,
    /// Matrix second row
    m9: f32,
    /// Matrix second row
    m13: f32,
    /// Matrix third row
    m2: f32,
    /// Matrix third row
    m6: f32,
    /// Matrix third row
    m10: f32,
    /// Matrix third row
    m14: f32,
    /// Matrix fourth row
    m3: f32,
    /// Matrix fourth row
    m7: f32,
    /// Matrix fourth row
    m11: f32,
    /// Matrix fourth row
    m15: f32,
};

/// Color, 4 components, R8G8B8A8 (32bit)
pub const Color = extern struct {
    r: u8,
    g: u8,
    b: u8,
    a: u8,
};

pub const Rectangle = extern struct {
    /// Rectangle top-left corner position x
    x: f32,
    /// Rectangle top-left corner position y
    y: f32,
    /// Rectangle width
    width: f32,
    /// Rectangle height
    height: f32,
};
/// Image, pixel data stored in CPU memory (RAM)
pub const Image = extern struct {
    /// Image raw data
    data: ?*anyopaque,
    /// Image base width
    width: i32,
    /// Image base height
    height: i32,
    /// Mipmap levels, 1 by default
    mipmaps: i32 = 1,
    /// Data format (PixelFormat type)
    format: PixelFormat,
};
/// Texture, tex data stored in GPU memory (VRAM)
pub const Texture = extern struct {
    /// OpenGL texture id
    id: u32,
    /// Texture base width
    width: i32,
    /// Texture base height
    height: i32,
    /// Mipmap levels, 1 by default
    mipmaps: i32,
    /// Data format (PixelFormat type)
    format: PixelFormat,
};
pub const Texture2D = Texture;
pub const TextureCubeMap = Texture;
pub const RenderTexture = extern struct {
    /// OpenGL framebuffer object id
    id: u32,
    /// Color buffer attachment texture
    texture: Texture,
    /// Depth buffer attachment texture
    depth: Texture,
};
pub const RenderTexture2D = RenderTexture;

/// NPatchInfo, n-patch layout info
pub const NPatchInfo = extern struct {
    /// Texture source rectangle
    source: Rectangle,
    /// Left border offset
    left: i32,
    /// Top border offset
    top: i32,
    /// Right border offset
    right: i32,
    /// Bottom border offset
    bottom: i32,
    /// Layout of the n-patch: 3x3, 1x3 or 3x1
    layout: i32,
};

/// GlyphInfo, font characters glyphs info
pub const GlyphInfo = extern struct {
    /// Character value (Unicode)
    value: i32,
    /// Character offset X when drawing
    offsetX: i32,
    /// Character offset Y when drawing
    offsetY: i32,
    /// Character advance position X
    advanceX: i32,
    /// Character image data
    image: Image,
};

/// Font, font texture and GlyphInfo array data
pub const Font = extern struct {
    /// Base size (default chars height)
    baseSize: i32,
    /// Number of glyph characters
    glyphCount: i32,
    /// Padding around the glyph characters
    glyphPadding: i32,
    /// Texture atlas containing the glyphs
    texture: Texture2D,
    /// Rectangles in texture for the glyphs
    recs: *Rectangle,
    /// Glyphs info data
    glyphs: *GlyphInfo,
};

/// Camera, defines position/orientation in 3d space
pub const Camera3D = extern struct {
    /// Camera position
    position: Vector3,
    /// Camera target it looks-at
    target: Vector3,
    /// Camera up vector (rotation over its axis)
    up: Vector3,

    /// Camera field-of-view aperture in Y (degrees) in perspective, used as near plane width in orthographic
    fovy: f32,
    /// Camera projection: CAMERA_PERSPECTIVE or CAMERA_ORTHOGRAPHIC
    projection: i32,
};
pub const Camera = Camera3D;
//
/// Camera2D, defines position/orientation in 2d space
pub const Camera2D = extern struct {
    /// Camera offset (displacement from target)
    offset: Vector2,
    /// Camera target (rotation and zoom origin)
    target: Vector2,
    /// Camera rotation in degrees
    rotation: f32,
    /// Camera zoom (scaling), should be 1.0f by default
    zoom: f32,
};
// // Mesh, vertex data and vao/vbo
pub const Mesh = ray.Mesh;
pub const Shader = ray.Shader;
pub const MaterialMap = extern struct {
    /// Material map texture
    texture: Texture2D,
    /// Material map color
    color: Color,
    /// Material map value
    value: f32,
};
pub const Material = extern struct {
    /// Material shader
    shader: Shader,
    /// Material maps array (MAX_MATERIAL_MAPS)
    maps: [*c]MaterialMap,
    /// Material generic parameters (if required)
    params: [4]f32,
};
// // Transform, vertex transformation data
pub const Transform = extern struct {
    translation: Vector3,
    rotation: Quaternion,
    scale: Vector3,
};
pub const BoneInfo = ray.BoneInfo;
pub const Model = extern struct {
    /// Local transform matrix
    transform: Matrix,

    /// Number of meshes
    mesh_count: i32,
    /// Number of materials
    material_count: i32,
    /// Meshes array
    meshes: [*c]Mesh,
    /// Materials array
    materials: [*c]Material,
    /// Mesh material number
    mesh_material: [*c]i32,

    /// Number of bones
    bone_count: i32,
    /// Bones information (skeleton)
    bones: [*c]BoneInfo,
    /// Bones base transformation (pose)
    bind_pose: [*c]Transform,
};

pub const ModelAnimation = extern struct {
    /// Number of bones
    bone_count: i32,
    /// Number of animation frames
    frame_count: i32,
    /// Bones information (skeleton)
    bones: [*c]BoneInfo,
    /// Poses array by frame
    frame_poses: [*c]*Transform,
    /// Animation name
    name: [32]u8,
};

pub const Ray = extern struct {
    /// Ray position (origin)
    position: Vector3,
    /// Ray direction
    direction: Vector3,
};

pub const RayCollision = extern struct {
    /// Did the ray hit something?
    hit: bool,
    /// Distance to the nearest hit
    distance: f32,
    /// Point of the nearest hit
    point: Vector3,
    /// Surface normal of hit
    normal: Vector3,
};

pub const BoundingBox = extern struct {
    /// Minimum vertex box-corner
    min: Vector3,
    /// Maximum vertex box-corner
    max: Vector3,
};
pub const Wave = ray.Wave;

pub const rAudioBuffer = ray.rAudioBuffer;
pub const rAudioProcessor = ray.rAudioProcessor;
pub const AudioStream = ray.AudioStream;
pub const Sound = ray.Sound;
pub const Music = ray.Music;

pub const VrDeviceInfo = ray.VrDeviceInfo;
pub const VrStereoConfig = ray.VrStereoConfig;

pub const FilePathList = ray.FilePathList;

pub const AutomationEvent = ray.AutomationEvent;
pub const AutomationEventList = ray.AutomationEventList;
