const Color = @import("structs.zig").Color;

/// helper function to create a raylib color
pub inline fn newColor(r: u8, g: u8, b: u8, a: u8) Color {
    return Color{
        .r = r,
        .g = g,
        .b = b,
        .a = a,
    };
}
pub const LightGray = newColor(200, 200, 200, 255); // Light Gray
pub const Gray = newColor(130, 130, 130, 255); // Gray
pub const DarkGray = newColor(80, 80, 80, 255); // Dark Gray
pub const Yellow = newColor(253, 249, 0, 255); // Yellow
pub const Gold = newColor(255, 203, 0, 255); // Gold
pub const Orange = newColor(255, 161, 0, 255); // Orange
pub const Pink = newColor(255, 109, 194, 255); // Pink
pub const Red = newColor(230, 41, 55, 255); // Red
pub const Maroon = newColor(190, 33, 55, 255); // Maroon
pub const Green = newColor(0, 228, 48, 255); // Green
pub const Lime = newColor(0, 158, 47, 255); // Lime
pub const DarkGreen = newColor(0, 117, 44, 255); // Dark Green
pub const SkyBlue = newColor(102, 191, 255, 255); // Sky Blue
pub const Blue = newColor(0, 121, 241, 255); // Blue
pub const DarkBlue = newColor(0, 82, 172, 255); // Dark Blue
pub const Purple = newColor(200, 122, 255, 255); // Purple
pub const Violet = newColor(135, 60, 190, 255); // Violet
pub const DarkPurple = newColor(112, 31, 126, 255); // Dark Purple
pub const Beige = newColor(211, 176, 131, 255); // Beige
pub const Brown = newColor(127, 106, 79, 255); // Brown
pub const DarkBrown = newColor(76, 63, 47, 255); // Dark Brown

pub const White = newColor(255, 255, 255, 255); // White
pub const Black = newColor(0, 0, 0, 255); // Black
pub const Blank = newColor(0, 0, 0, 0); // Blank (Transparent)
pub const Magenta = newColor(255, 0, 255, 255); // Magenta
pub const RayWhite = newColor(245, 245, 245, 255); // My own White (raylib logo)
