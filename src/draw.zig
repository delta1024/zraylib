const std = @import("std");
const assert = std.debug.assert;
const ray = @cImport({
    @cInclude("raylib.h");
});
pub const Color = ray.Color;
pub const Location = struct {
    x: i32,
    y: i32,
};
pub const Circle = struct {
    radius: f32,
    color: Color,
    pub fn draw(self: *Circle, loc: Location) void {
        ray.DrawCircle(loc.x, loc.y, self.radius, self.color);
    }
    pub fn drawable(self: *Circle) Drawable {
        return Drawable.init(self);
    }
};
pub const CircleGradient = struct {
    radius: f32,
    color1: Color,
    color2: Color,
    pub fn draw(self: *CircleGradient, loc: Location) void {
        ray.DrawCircleGradient(loc.x, loc.y, self.radius, self.color1, self.color2);
    }
    pub fn drawable(self: *CircleGradient) Drawable {
        return Drawable.init(self);
    }
};
pub const CircleLines = struct {
    radius: f32,
    color: Color,
    pub fn draw(self: *CircleLines, loc: Location) void {
        ray.DrawCircleLines(loc.x, loc.y, self.radius, self.color);
    }
    pub fn drawable(self: *CircleLines) Drawable {
        return Drawable.init(self);
    }
};
pub const Text = struct {
    text: [*c]const u8,
    font_size: i32,
    color: Color,
    pub fn draw(self: *Text, loc: Location) void {
        ray.DrawText(self.text, loc.x, loc.y, self.font_size, self.color);
    }
    pub fn drawable(self: *Text) Drawable {
        return Drawable.init(self);
    }
};
pub const Drawable = struct {
    const VTable = struct {
        draw: *const fn (*anyopaque, Location) void,
    };
    ptr: *anyopaque,
    vtable: *const VTable,
    pub fn draw(self: Drawable, loc: Location) void {
        self.vtable.draw(self.ptr, loc);
    }

    pub fn init(ptr: anytype) Drawable {
        const Ptr = @TypeOf(ptr);
        const PtrInfo = @typeInfo(Ptr);
        if (PtrInfo != .Pointer) @compileError("ptr must be a pointer");
        if (PtrInfo.Pointer.size != .One) @compileError("ptr must be a single item ptr");

        const impl = struct {
            pub fn draw(ctx: *anyopaque, loc: Location) void {
                const self: Ptr = @ptrCast(@alignCast(ctx));
                PtrInfo.Pointer.child.draw(self, loc);
            }
        };

        return .{
            .ptr = ptr,
            .vtable = &.{
                .draw = impl.draw,
            },
        };
    }
};
