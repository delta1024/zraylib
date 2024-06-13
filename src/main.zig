const std = @import("std");
const ray = @cImport({
    @cInclude("raylib.h");
});

pub fn main() !void {
    const screen_width: i32 = 800;
    const screen_height: i32 = 450;
    ray.InitWindow(screen_width, screen_height, "Jarasic Tycoon");
    defer ray.CloseWindow();

    ray.SetTargetFPS(60);

    while (!ray.WindowShouldClose()) {
        ray.BeginDrawing();

        ray.ClearBackground(ray.RAYWHITE);

        ray.DrawText("Does an empty window count as a game?", 190, 200, 20, ray.LIGHTGRAY);

        ray.EndDrawing();
    }
}
