const ray = @cImport(@cInclude("raylib.h"));
pub const Color = extern struct {
    r: u8,
    g: u8,
    b: u8,
    a: u8,
};
pub const Vector2 = @Vector(2, f32);
