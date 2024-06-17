const zty = @import("structs.zig");
const Image = zty.Image;
const Texture2D = zty.Texture2D;
const Color = zty.Color;
const Rectangle = zty.Rectangle;
const Vector2 = zty.Vector2;
const RenderTexture2D = zty.RenderTexture2D;
const ray = @cImport(@cInclude("raylib.h"));
pub fn unloadImage(image: Image) void {
    ray.UnloadImage(@bitCast(image));
}
pub fn loadTextureFromImage(image: Image) Texture2D {
    return @bitCast(ray.LoadTextureFromImage(@bitCast(image)));
}
pub fn loadRenderTexture(width: i32, height: i32) RenderTexture2D {
    return @bitCast(ray.LoadRenderTexture(width, height));
}
pub fn loadImageFremTexture(texture: Texture2D) Image {
    return @bitCast(ray.LoadImageFromTexture(@bitCast(texture)));
}
pub fn unloadRenderTexture(target: RenderTexture2D) void {
    ray.UnloadRenderTexture(@bitCast(target));
}
pub fn unloadTexture(texture: Texture2D) void {
    ray.UnloadTexture(@bitCast(texture));
}
pub fn drawTexture(texture: Texture2D, x: i32, y: i32, tint: Color) void {
    ray.DrawTexture(@bitCast(texture), x, y, @bitCast(tint));
}
pub fn drawTextureRec(texture: Texture2D, source: Rectangle, position: Vector2, tint: Color) void {
    ray.DrawTextureRec(@bitCast(texture), @bitCast(source), @bitCast(position), @bitCast(tint));
}

pub fn drawTexturePro(texture: Texture2D, source: Rectangle, dest: Rectangle, origin: Vector2, rotation: f32, tint: Color) void {
    ray.DrawTexturePro(@bitCast(texture), @bitCast(source), @bitCast(dest), @bitCast(origin), rotation, @bitCast(tint));
}
pub fn fade(color: Color, alpha: f32) Color {
    return @bitCast(ray.Fade(@bitCast(color), alpha));
}
pub fn getImageColor(image: Image, x: i32, y: i32) Color {
    return @bitCast(ray.GetImageColor(@bitCast(image), x, y));
}
