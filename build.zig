const std = @import("std");

// Although this function looks imperative, note that its job is to
// declaratively construct a build graph that will be executed by an external
// runner.
pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});
    const raydep = b.dependency("raylib", .{
        .target = target,
        .optimize = optimize,
    });
    const lib = raydep.artifact("raylib");
    b.installArtifact(lib);

    const raymod = b.addModule("raylib", .{
        .optimize = optimize,
        .target = target,
        .link_libc = true,
        .root_source_file = b.path("src/root.zig"),
    });
    raymod.linkLibrary(lib);
}
