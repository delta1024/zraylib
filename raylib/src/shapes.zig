const std = @import("std");
const ray = @cImport(@cInclude("raylib.h"));
const rty = @import("structs.zig");
const Color = rty.Color;
pub fn drawRectangle(pos_x: u32, pos_y: u32, width: u32, height: u32, color: Color) void {
    ray.DrawRectangle(@intCast(pos_x), @intCast(pos_y), @intCast(width), @intCast(height), @as(ray.Color, @bitCast(color)));
}
