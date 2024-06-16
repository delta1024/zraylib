const zty = @import("structs.zig");
const Image = zty.Image;
const Texture2D = zty.Texture2D;
const Color = zty.Color;
const ray = @cImport(@cInclude("raylib.h"));
pub fn unloadImage(image: Image) void {
    ray.UnloadImage(@bitCast(image));
}
pub fn loadTextureFromImage(image: Image) Texture2D {
    return @bitCast(ray.LoadTextureFromImage(@bitCast(image)));
}
pub fn unloadTexture(texture: Texture2D) void {
    ray.UnloadTexture(@bitCast(texture));
}
pub fn drawTexture(texture: Texture2D, x: i32, y: i32, tint: Color) void {
    ray.DrawTexture(@bitCast(texture), x, y, @bitCast(tint));
}

pub fn fade(color: Color, alpha: f32) Color {
    return @bitCast(ray.Fade(@bitCast(color), alpha));
}
