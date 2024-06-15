const std = @import("std");
const ray = @cImport(@cInclude("raylib.h"));
const rty = @import("structs.zig");
const Color = rty.Color;
const Vector2 = rty.Vector2;
pub fn drawRectangle(pos_x: u32, pos_y: u32, width: u32, height: u32, color: Color) void {
    ray.DrawRectangle(@intCast(pos_x), @intCast(pos_y), @intCast(width), @intCast(height), @as(ray.Color, @bitCast(color)));
}
pub fn drawRectangleV(position: Vector2, size: Vector2, color: Color) void {
    ray.DrawRectangleV(@bitCast(position), @bitCast(size), @bitCast(color));
}
