const ray = @cImport(@cInclude("raylib.h"));
pub fn drawFPS(x: i32, y: i32) void {
    ray.DrawFPS(@intCast(x), @intCast(y));
}
