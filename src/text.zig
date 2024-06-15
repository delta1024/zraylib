const ray = @cImport(@cInclude("raylib.h"));
pub fn drawFPS(x: u32, y: u32) void {
    ray.DrawFPS(@intCast(x), @intCast(y));
}
