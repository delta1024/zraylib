const std = @import("std");
const mem = std.mem;
const ray = @cImport(@cInclude("raylib.h"));
const t = @import("structs.zig");

pub fn initWindow(width: u32, height: u32, title: [*:0]const u8) void {
    ray.InitWindow(@intCast(width), @intCast(height), title);
}

pub const closeWindow = ray.CloseWindow;
pub const windowShouldClose = ray.WindowShouldClose;
pub fn clearBackground(color: t.Color) void {
    ray.ClearBackground(@bitCast(color));
}
pub const beginDrawing = ray.BeginDrawing;
pub const endDrawing = ray.EndDrawing;

pub fn setTargetFps(fps: u32) void {
    ray.SetTargetFPS(@intCast(fps));
}
pub fn getScreenHeight() u32 {
    return @bitCast(ray.GetScreenHeight());
}
pub fn getScreenWidth() u32 {
    return @bitCast(ray.GetScreenWidth());
}
