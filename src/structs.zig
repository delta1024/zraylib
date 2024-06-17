const e = @import("enums.zig");
const PixelFormat = e.PixelFormat;
pub const Color = extern struct {
    r: u8,
    g: u8,
    b: u8,
    a: u8,
};
pub const Rectangle = extern struct {
    x: f32,
    y: f32,
    width: f32,
    height: f32,
};
pub const Image = extern struct {
    data: ?*anyopaque,
    width: i32,
    height: i32,
    mipmaps: i32,
    format: PixelFormat,
};
pub const Texture = extern struct {
    id: u32,
    width: i32,
    height: i32,
    mipmaps: i32,
    format: PixelFormat,
};
pub const Texture2D = Texture;
pub const RenderTexture = extern struct {
    id: i32,
    texture: Texture,
    depth: Texture,
};
pub const RenderTexture2D = RenderTexture;
pub const Vector2 = @Vector(2, f32);
