const std = @import("std");
const raylib = @import("raylib");
const Color = raylib.Color;
const colors: [3]Color = bk: {
    const c = raylib.colors;
    break :bk .{ c.Red, c.Blue, c.Green };
};
const screen = struct {
    pub const width = 800;
    pub const height = 450;
};
const fps: u32 = 60;
const State = struct {
    frame: u32,
    frame_count: u32,
    pub fn tick(self: *State) void {
        self.frame += 1;
        if (self.frame > fps) {
            self.frame = 0;
            self.frame_count += 1;
        }
        if (self.frame_count > 2) {
            self.frame_count = 0;
        }
    }
};
pub fn main() !void {
    var state = State{ .frame = 0, .frame_count = 0 };
    raylib.initWindow(screen.width, screen.height, "Jarasic Tycoon");
    defer raylib.closeWindow();

    raylib.setTargetFps(fps);

    while (!raylib.windowShouldClose()) {
        state.tick();
        raylib.beginDrawing();
        defer raylib.endDrawing();
        raylib.clearBackground(raylib.colors.White);

        raylib.drawRectangle((screen.width / 2) - 32, (screen.height / 2) - 32, 32, 32, colors[state.frame_count]);
    }
}
