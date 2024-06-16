const std = @import("std");
const mem = std.mem;
const ray = @cImport(@cInclude("raylib.h"));
const t = @import("structs.zig");
const Key = @import("enums.zig").Key;

pub fn initWindow(width: i32, height: i32, title: [*:0]const u8) void {
    ray.InitWindow(width, height, title);
}

pub const closeWindow = ray.CloseWindow;
pub const windowShouldClose = ray.WindowShouldClose;
pub fn clearBackground(color: t.Color) void {
    ray.ClearBackground(@bitCast(color));
}
pub const beginDrawing = ray.BeginDrawing;
pub const endDrawing = ray.EndDrawing;

pub fn setTargetFps(fps: i32) void {
    ray.SetTargetFPS(fps);
}
pub fn getScreenHeight() i32 {
    return @bitCast(ray.GetScreenHeight());
}
pub fn getScreenWidth() i32 {
    return @bitCast(ray.GetScreenWidth());
}
pub fn getFPS() i32 {
    return @intCast(ray.GetFPS());
}
pub fn isKeyPressed(k: Key) bool {
    return ray.IsKeyPressed(@intFromEnum(k));
}
pub fn isKeyDown(k: Key) bool {
    return ray.IsKeyDown(@intFromEnum(k));
}
pub fn isKeyReleased(k: Key) bool {
    return ray.IsKeyReleased(@intFromEnum(k));
}

pub fn isKeyUp(k: Key) bool {
    return ray.IsKeyUp(@intFromEnum(k));
}
