const std = @import("std");
const ray = @cImport({
    @cInclude("raylib.h");
});
const draw = @import("draw.zig");
const Circle = draw.Circle;
const CircleGrad = draw.CircleGradient;
const CircleLine = draw.CircleLines;
const Drawable = draw.Drawable;

pub fn main() !void {
    const screen_width: i32 = 800;
    const screen_height: i32 = 450;

    var circle = Circle{
        .radius = 35,
        .color = ray.DARKBLUE,
    };
    var c_line = CircleLine{
        .radius = 80,
        .color = ray.DARKBLUE,
    };
    var c_grade = CircleGrad{
        .radius = 60,
        .color1 = ray.GREEN,
        .color2 = ray.SKYBLUE,
    };

    const circles = [_]struct { loc: draw.Location, draw: Drawable }{
        .{
            .loc = .{ .x = screen_width / 5, .y = 120 },
            .draw = circle.drawable(),
        },
        .{
            .loc = .{ .x = screen_width / 5, .y = 220 },
            .draw = c_grade.drawable(),
        },
        .{
            .loc = .{ .x = screen_width / 5, .y = 340 },
            .draw = c_line.drawable(),
        },
    };
    var text = draw.Text{
        .text = "I drew some circles",
        .font_size = 20,
        .color = ray.LIGHTGRAY,
    };
    ray.InitWindow(screen_width, screen_height, "Jarasic Tycoon");
    defer ray.CloseWindow();

    ray.SetTargetFPS(60);

    while (!ray.WindowShouldClose()) {
        ray.BeginDrawing();

        ray.ClearBackground(ray.RAYWHITE);

        text.draw(.{
            .x = 350,
            .y = 150,
        });
        for (circles) |pos|
            pos.draw.draw(pos.loc);

        ray.EndDrawing();
    }
}
