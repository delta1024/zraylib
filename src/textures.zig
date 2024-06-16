const zty = @import("structs.zig");
const Image = zty.Image;
const Texture2D = zty.Texture2D;
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
