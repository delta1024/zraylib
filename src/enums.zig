/// System/Window config flags
/// NOTE: Every bit registers one state (use it with bit masks)
/// By default all flags are set to 0
pub const ConfigFlags = enum(c_int) {
    /// Set to try enabling V-Sync on GPU
    VsyncHint = 0x00000040,
    /// Set to run program in fullscreen
    FullscreenMode = 0x00000002,
    /// Set to allow resizable window
    WindowResizable = 0x00000004,
    /// Set to disable window decoration (frame and buttons)
    WindowUndecorated = 0x00000008,
    /// Set to hide window
    WindowHidden = 0x00000080,
    /// Set to minimize window (iconify)
    WindowMinimized = 0x00000200,
    /// Set to maximize window (expanded to monitor)
    WindowMaximized = 0x00000400,
    /// Set to window non focused
    WindowUnfocused = 0x00000800,
    /// Set to window always on top
    WindowTopmost = 0x00001000,
    /// Set to allow windows running while minimized
    WindowAlways_run = 0x00000100,
    /// Set to allow transparent framebuffer
    WindowTransparent = 0x00000010,
    /// Set to support HighDPI
    WindowHighdpi = 0x00002000,
    /// Set to support mouse passthrough, only supported when FLAG_WINDOW_UNDECORATED
    WindowMousePassthrough = 0x00004000,
    /// Set to run program in borderless windowed mode
    BorderlessWindowedMode = 0x00008000,
    /// Set to try enabling MSAA 4X
    Msaa4xHint = 0x00000020,
    /// Set to try enabling interlaced video format (for V3D)
    InterlacedHint = 0x00010000,
};

/// Organized by priority level
pub const TraceLogLevel = enum(c_int) {
    /// Display all logs
    All = 0,
    /// Trace logging, intended for internal use only
    Trace,
    /// Debug logging, used for internal debugging, it should be disabled on release builds
    Debug,
    /// Info logging, used for program execution info
    Info,
    /// Warning logging, used on recoverable failures
    Warning,
    /// Error logging, used on unrecoverable failures
    Error,
    /// Fatal logging, used to abort program: exit(EXIT_FAILURE)
    Fatal,
    /// Disable logging
    None,
};

/// Keyboard keys (US keyboard layout)
/// NOTE: Use GetKeyPressed() to allow redefining
/// required keys for alternative layouts
pub const KeyboardKey = enum(c_int) {
    /// Key: NULL, used for no key pressed
    Null = 0,
    /// Key: '
    Apostrophe = 39,
    /// Key: ,
    Comma = 44,
    /// Key: -
    Minus = 45,
    /// Key: .
    Period = 46,
    /// Key: /
    Slash = 47,
    /// Key: 0
    Zero = 48,
    /// Key: 1
    One = 49,
    /// Key: 2
    Two = 50,
    /// Key: 3
    Three = 51,
    /// Key: 4
    Four = 52,
    /// Key: 5
    Five = 53,
    /// Key: 6
    Six = 54,
    /// Key: 7
    Seven = 55,
    /// Key: 8
    Eight = 56,
    /// Key: 9
    Nine = 57,
    /// Key: ;
    Semicolon = 59,
    /// Key: =
    Equal = 61,
    /// Key: A | a
    A = 65,
    /// Key: B | b
    B = 66,
    /// Key: C | c
    C = 67,
    /// Key: D | d
    D = 68,
    /// Key: E | e
    E = 69,
    /// Key: F | f
    F = 70,
    /// Key: G | g
    G = 71,
    /// Key: H | h
    H = 72,
    /// Key: I | i
    I = 73,
    /// Key: J | j
    J = 74,
    /// Key: K | k
    K = 75,
    /// Key: L | l
    L = 76,
    /// Key: M | m
    M = 77,
    /// Key: N | n
    N = 78,
    /// Key: O | o
    O = 79,
    /// Key: P | p
    P = 80,
    /// Key: Q | q
    Q = 81,
    /// Key: R | r
    R = 82,
    /// Key: S | s
    S = 83,
    /// Key: T | t
    T = 84,
    /// Key: U | u
    U = 85,
    /// Key: V | v
    V = 86,
    /// Key: W | w
    W = 87,
    /// Key: X | x
    X = 88,
    /// Key: Y | y
    Y = 89,
    /// Key: Z | z
    Z = 90,
    /// Key: [
    LeftBracket = 91,
    /// Key: '\'
    Backslash = 92,
    /// Key: ]
    RightBracket = 93,
    /// Key: `
    Grave = 96,
    /// Key: Space
    Space = 32,
    /// Key: Esc
    Escape = 256,
    /// Key: Enter
    Enter = 257,
    /// Key: Tab
    Tab = 258,
    /// Key: Backspace
    Backspace = 259,
    /// Key: Ins
    Insert = 260,
    /// Key: Del
    Delete = 261,
    /// Key: Cursor right
    Right = 262,
    /// Key: Cursor left
    Left = 263,
    /// Key: Cursor down
    Down = 264,
    /// Key: Cursor up
    Up = 265,
    /// Key: Page up
    PageUp = 266,
    /// Key: Page down
    PageDown = 267,
    /// Key: Home
    Home = 268,
    /// Key: End
    End = 269,
    /// Key: Caps lock
    CapsLock = 280,
    /// Key: Scroll down
    ScrollLock = 281,
    /// Key: Num lock
    NumLock = 282,
    /// Key: Print screen
    PrintScreen = 283,
    /// Key: Pause
    Pause = 284,
    /// Key: F1
    F1 = 290,
    /// Key: F2
    F2 = 291,
    /// Key: F3
    F3 = 292,
    /// Key: F4
    F4 = 293,
    /// Key: F5
    F5 = 294,
    /// Key: F6
    F6 = 295,
    /// Key: F7
    F7 = 296,
    /// Key: F8
    F8 = 297,
    /// Key: F9
    F9 = 298,
    /// Key: F10
    F10 = 299,
    /// Key: F11
    F11 = 300,
    /// Key: F12
    F12 = 301,
    /// Key: Shift left
    LeftShift = 340,
    /// Key: Control left
    LeftControl = 341,
    /// Key: Alt left
    LeftAlt = 342,
    /// Key: Super left
    LeftSuper = 343,
    /// Key: Shift right
    RightShift = 344,
    /// Key: Control right
    RightControl = 345,
    /// Key: Alt right
    RightAlt = 346,
    /// Key: Super right
    RightSuper = 347,
    /// Key: KB menu
    KbMenu = 348,
    /// Key: Keypad 0
    Kp0 = 320,
    /// Key: Keypad 1
    Kp1 = 321,
    /// Key: Keypad 2
    Kp2 = 322,
    /// Key: Keypad 3
    Kp3 = 323,
    /// Key: Keypad 4
    Kp4 = 324,
    /// Key: Keypad 5
    Kp5 = 325,
    /// Key: Keypad 6
    Kp6 = 326,
    /// Key: Keypad 7
    Kp7 = 327,
    /// Key: Keypad 8
    Kp8 = 328,
    /// Key: Keypad 9
    Kp9 = 329,
    /// Key: Keypad .
    KpDecimal = 330,
    /// Key: Keypad /
    KpDivide = 331,
    /// Key: Keypad *
    KpMultiply = 332,
    /// Key: Keypad -
    KpSubtract = 333,
    /// Key: Keypad +
    KpAdd = 334,
    /// Key: Keypad Enter
    KpEnter = 335,
    /// Key: Keypad =
    KpEqual = 336,
    /// Key: Android back button
    Back = 4,
    /// Key: Android menu button
    Menu = 5,
    /// Key: Android volume up button
    VolumeUp = 24,
    /// Key: Android volume down button
    VolumeDown = 25,
};
//
// // Add backwards compatibility support for deprecated names
// #define MOUSE_LEFT_BUTTON   MOUSE_BUTTON_LEFT
// #define MOUSE_RIGHT_BUTTON  MOUSE_BUTTON_RIGHT
// #define MOUSE_MIDDLE_BUTTON MOUSE_BUTTON_MIDDLE
//
pub const MouseButton = enum(c_int) {
    /// Mouse button left
    ButtonLeft = 0,
    /// Mouse button right
    ButtonRight = 1,
    /// Mouse button middle (pressed wheel)
    ButtonMiddle = 2,
    /// Mouse button side (advanced mouse device)
    ButtonSide = 3,
    /// Mouse button extra (advanced mouse device)
    ButtonExtra = 4,
    /// Mouse button forward (advanced mouse device)
    ButtonForwarD = 5,
    /// Mouse button back (advanced mouse device)
    ButtonBack = 6,
};

pub const MouseCursor = enum(c_int) {
    /// Default pointer shape
    Default = 0,
    /// Arrow shape
    Arrow = 1,
    /// Text writing cursor shape
    Ibeam = 2,
    /// Cross shape
    Crosshair = 3,
    /// Pointing hand cursor
    PointingHand = 4,
    /// Horizontal resize/move arrow shape
    ResizeEw = 5,
    /// Vertical resize/move arrow shape
    ResizeNs = 6,
    /// Top-left to bottom-right diagonal resize/move arrow shape
    ResizeNwse = 7,
    /// The top-right to bottom-left diagonal resize/move arrow shape
    ResizeNesw = 8,
    /// The omnidirectional resize/move cursor shape
    ResizeAll = 9,
    /// The operation-not-allowed shape
    NotAllowed = 10,
};
//
pub const GamepadButton = enum(c_int) {
    /// Unknown button, just for error checking
    Unknown = 0,
    /// Gamepad left DPAD up button
    LeftFaceUp,
    /// Gamepad left DPAD right button
    LeftFaceRight,
    /// Gamepad left DPAD down button
    LeftFaceDown,
    /// Gamepad left DPAD left button
    LeftFaceLeft,
    /// Gamepad right button up (i.e. PS3: Triangle, Xbox: Y)
    RightFaceUp,
    /// Gamepad right button right (i.e. PS3: Circle, Xbox: B)
    RightFaceRight,
    /// Gamepad right button down (i.e. PS3: Cross, Xbox: A)
    RightFaceDown,
    /// Gamepad right button left (i.e. PS3: Square, Xbox: X)
    RightFaceLeft,
    /// Gamepad top/back trigger left (first), it could be a trailing button
    LeftTrigger1,
    /// Gamepad top/back trigger left (second), it could be a trailing button
    LeftTrigger2,
    /// Gamepad top/back trigger right (first), it could be a trailing button
    RightTrigger1,
    /// Gamepad top/back trigger right (second), it could be a trailing button
    RightTrigger2,
    /// Gamepad center buttons, left one (i.e. PS3: Select)
    MiddleLeft,
    /// Gamepad center buttons, middle one (i.e. PS3: PS, Xbox: XBOX)
    Middle,
    /// Gamepad center buttons, right one (i.e. PS3: Start)
    MiddleRight,
    /// Gamepad joystick pressed button left
    LeftThumb,
    /// Gamepad joystick pressed button right
    RightThumb,
};

pub const GamepadAxis = enum(c_int) {
    /// Gamepad left stick X axis
    LeftX = 0,
    /// Gamepad left stick Y axis
    LeftY = 1,
    /// Gamepad right stick X axis
    RightX = 2,
    /// Gamepad right stick Y axis
    RightY = 3,
    /// Gamepad back trigger left, pressure level: [1..-1]
    LeftTrigger = 4,
    /// Gamepad back trigger right, pressure level: [1..-1]
    RightTrigger = 5,
};

pub const MaterialMapIndex = enum(c_int) {
    /// Albedo material (same as: MATERIAL_MAP_DIFFUSE)
    Albedo = 0,
    /// Metalness material (same as: MATERIAL_MAP_SPECULAR)
    Metalness,
    /// Normal material
    Normal,
    /// Roughness material
    Roughness,
    /// Ambient occlusion material
    Occlusion,
    /// Emission material
    Emission,
    /// Heightmap material
    Height,
    /// Cubemap material (NOTE: Uses GL_TEXTURE_CUBE_MAP)
    Cubemap,
    /// Irradiance material (NOTE: Uses GL_TEXTURE_CUBE_MAP)
    Irradiance,
    /// Prefilter material (NOTE: Uses GL_TEXTURE_CUBE_MAP)
    Prefilter,
    /// Brdf material
    Brdf,
};

// #define MATERIAL_MAP_DIFFUSE      MATERIAL_MAP_ALBEDO
// #define MATERIAL_MAP_SPECULAR     MATERIAL_MAP_METALNESS
//
pub const ShaderLocationIndex = enum(c_int) {
    /// Shader location: vertex attribute: position
    VertexPosition = 0,
    /// Shader location: vertex attribute: texcoord01
    VertexTexcoord01,
    /// Shader location: vertex attribute: texcoord02
    VertexTexcoord02,
    /// Shader location: vertex attribute: normal
    VertexNormal,
    /// Shader location: vertex attribute: tangent
    VertexTangent,
    /// Shader location: vertex attribute: color
    VertexColor,
    /// Shader location: matrix uniform: model-view-projection
    MatrixMvp,
    /// Shader location: matrix uniform: view (camera transform)
    MatrixView,
    /// Shader location: matrix uniform: projection
    MatrixProjection,
    /// Shader location: matrix uniform: model (transform)
    MatrixModel,
    /// Shader location: matrix uniform: normal
    MatrixNormal,
    /// Shader location: vector uniform: view
    VectorView,
    /// Shader location: vector uniform: diffuse color
    ColorDiffuse,
    /// Shader location: vector uniform: specular color
    ColorSpecular,
    /// Shader location: vector uniform: ambient color
    ColorAmbient,
    /// Shader location: sampler2d texture: albedo (same as: .MapDiffuse)
    MapAlbedo,
    /// Shader location: sampler2d texture: metalness (same as: .MapSpecular)
    MapMetalness,
    /// Shader location: sampler2d texture: normal
    MapNormal,
    /// Shader location: sampler2d texture: roughness
    MapRoughness,
    /// Shader location: sampler2d texture: occlusion
    MapOcclusion,
    /// Shader location: sampler2d texture: emission
    MapEmission,
    /// Shader location: sampler2d texture: height
    MapHeight,
    /// Shader location: samplerCube texture: cubemap
    MapCubemap,
    /// Shader location: samplerCube texture: irradiance
    MapIrradiance,
    /// Shader location: samplerCube texture: prefilter
    MapPrefilter,
    /// Shader location: sampler2d texture: brdf
    MapBrdf,
};
//
// #define SHADER_LOC_MAP_DIFFUSE      SHADER_LOC_MAP_ALBEDO
// #define SHADER_LOC_MAP_SPECULAR     SHADER_LOC_MAP_METALNESS
pub const ShaderUniformDataType = enum(c_int) {
    /// Shader uniform type: float
    Float = 0,
    /// Shader uniform type: vec2 (2 float)
    Vec2,
    /// Shader uniform type: vec3 (3 float)
    Vec3,
    /// Shader uniform type: vec4 (4 float)
    Vec4,
    /// Shader uniform type: int
    Int,
    /// Shader uniform type: ivec2 (2 int)
    Ivec2,
    /// Shader uniform type: ivec3 (3 int)
    Ivec3,
    /// Shader uniform type: ivec4 (4 int)
    Ivec4,
    /// Shader uniform type: sampler2d
    Sampler2d,
};

pub const ShaderAttributeType = enum(c_int) {
    /// Shader attribute type: float
    Float = 0,
    /// Shader attribute type: vec2 (2 float)
    Vec2,
    /// Shader attribute type: vec3 (3 float)
    Vec3,
    /// Shader attribute type: vec4 (4 float)
    Vec4,
};

/// NOTE: Support depends on OpenGL version and platform
pub const PixelFormat = enum(c_int) {
    /// 8 bit per pixel (no alpha)
    UncompressedGrayscale = 1,
    /// 8*2 bpp (2 channels)
    UncompressedGrayAlpha,
    /// 16 bpp
    UncompressedR5G6B5,
    /// 24 bpp
    UncompressedR8G8B8,
    /// 16 bpp (1 bit alpha)
    UncompressedR5G5B5A1,
    /// 16 bpp (4 bit alpha)
    UncompressedR4G4B4A4,
    /// 32 bpp
    UncompressedR8G8B8A8,
    /// 32 bpp (1 channel - float)
    UncompressedR32,
    /// 32*3 bpp (3 channels - float)
    UncompressedR32G32B32,
    /// 32*4 bpp (4 channels - float)
    UncompressedR32G32B32A32,
    /// 16 bpp (1 channel - half float)
    UncompressedR16,
    /// 16*3 bpp (3 channels - half float)
    UncompressedR16G16B16,
    /// 16*4 bpp (4 channels - half float)
    UncompressedR16G16B16A16,
    /// 4 bpp (no alpha)
    CompressedDxt1Rgb,
    /// 4 bpp (1 bit alpha)
    CompressedDxt1Rgba,
    /// 8 bpp
    CompressedDxt3Rgba,
    /// 8 bpp
    CompressedDxt5Rgba,
    /// 4 bpp
    CompressedEtc1Rgb,
    /// 4 bpp
    CompressedEtc2Rgb,
    /// 8 bpp
    CompressedEtc2EacRgba,
    /// 4 bpp
    CompressedPvrtRgb,
    /// 4 bpp
    CompressedPvrtRgba,
    /// 8 bpp
    CompressedAstc4X4Rgba,
    /// 2 bpp
    CompressedAstc8X8Rgba,
};

/// NOTE 1: Filtering considers mipmaps if available in the texture
/// NOTE 2: Filter is accordingly set for minification and magnification
pub const TextureFilter = enum(c_int) {
    /// No filter, just pixel approximation
    Point = 0,
    /// Linear filtering
    Bilinear,
    /// Trilinear filtering (linear with mipmaps)
    Trilinear,
    /// Anisotropic filtering 4x
    Anisotropic4X,
    /// Anisotropic filtering 8x
    Anisotropic8X,
    /// Anisotropic filtering 16x
    Anisotropic16X,
};

/// Texture parameters: wrap mode
pub const TextureWrap = enum(c_int) {
    /// Repeats texture in tiled mode
    Repeat = 0,
    /// Clamps texture to edge pixel in tiled mode
    Clamp,
    /// Mirrors and repeats the texture in tiled mode
    MirrorRepeat,
    /// Mirrors and clamps to border the texture in tiled mode
    MirrorClamp,
};

pub const CubemapLayout = enum(c_int) {
    /// Automatically detect layout type
    AutoDetect = 0,
    /// Layout is defined by a vertical line with faces
    LineVertical,
    /// Layout is defined by a horizontal line with faces
    LineHorizontal,
    /// Layout is defined by a 3x4 cross with cubemap faces
    CrossThreeByFour,
    /// Layout is defined by a 4x3 cross with cubemap faces
    CrossFourByThree,
};

/// Font type, defines generation method
pub const FloatType = enum(c_int) {
    /// Default font generation, anti-aliased
    Default = 0,
    /// Bitmap font generation, no anti-aliasing
    Bitmap,
    /// SDF font generation, requires external shader
    Sdf,
};

/// Color blending modes (pre-defined)
pub const BlendMode = enum(c_int) {
    /// Blend textures considering alpha (default)
    Alpha = 0,
    /// Blend textures adding colors
    Additive,
    /// Blend textures multiplying colors
    Multiplied,
    /// Blend textures adding colors (alternative)
    Add_Colors,
    /// Blend textures subtracting colors (alternative)
    SubtractColors,
    /// Blend premultiplied textures considering alpha
    AlphaPremultiply,
    /// Blend textures using custom src/dst factors (use rlSetBlendFactors())
    Custom,
    /// Blend textures using custom rgb/alpha separate src/dst factors (use rlSetBlendFactorsSeparate())
    CustomSeparate,
};

///  NOTE: Provided as bit-wise flags to enable only desired gestures
pub const Gesture = enum(c_int) {
    /// No gesture
    None = 0,
    /// Tap gesture
    Tap = 1,
    /// Double tap gesture
    Doubletap = 2,
    /// Hold gesture
    Hold = 4,
    /// Drag gesture
    Drag = 8,
    /// Swipe right gesture
    SwipeRight = 16,
    /// Swipe left gesture
    SwipeLeft = 32,
    /// Swipe up gesture
    SwipeUp = 64,
    /// Swipe down gesture
    SwipeDown = 128,
    /// Pinch in gesture
    PinchIn = 256,
    /// Pinch out gesture
    PinchOut = 512,
};

pub const CameraMode = enum(c_int) {
    /// Camera custom, controlled by user (UpdateCamera() does nothing)
    Custom = 0,
    /// Camera free mode
    Free,
    /// Camera orbital, around target, zoom supported
    Orbital,
    /// Camera first person
    FirstPerson,
    /// Camera third person
    ThirdPerson,
};

pub const CameraProjection = enum(c_int) {
    /// Perspective projection
    Perspective = 0,
    /// Orthographic projection
    Orthographic,
};

pub const NPatchLayout = enum(c_int) {
    /// Npatch layout: 3x3 tiles
    NinePatch = 0,
    /// Npatch layout: 1x3 tiles
    ThreePatchVertical,
    /// Npatch layout: 3x1 tiles
    ThreePatchHorizontal,
};
