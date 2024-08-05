const std = @import("std");

// Although this function looks imperative, note that its job is to
// declaratively construct a build graph that will be executed by an external
// runner.
pub fn build(b: *std.Build) !void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const link_dyn = b.systemIntegrationOption("raylib", .{
        .default = true,
    });

    const raymod = b.addModule("raylib", .{
        .optimize = optimize,
        .target = target,
        .link_libc = true,
        .root_source_file = b.path("src/root.zig"),
    });
    if (!link_dyn) {
        const raydep = b.lazyDependency("raylib", .{
            .target = target,
            .optimize = optimize,
        }) orelse return;
        const lib = raydep.artifact("raylib");
        b.installArtifact(lib);
        raymod.linkLibrary(lib);
    } else {
        raymod.linkSystemLibrary("raylib", .{ .needed = true });
    }

    const archive_step = b.step("archive", "create source tarball");
    archive_step.dependOn(try gen_archive(b));
}
fn gen_archive(b: *std.Build) !*std.Build.Step {
    const archive = b.addSystemCommand(&.{
        "git",
        "archive",
        "--format",
        "tar",
        "-o",
        "raylib.tar",
        "HEAD",
    });
    const submods = b.addSystemCommand(&.{
        "git",
        "archive",
        "--format",
        "tar",
        "-o",
        "submodule.tar",
        "HEAD",
    });
    submods.setCwd(b.path("raylib/"));
    submods.step.dependOn(&archive.step);
    const concat = b.addSystemCommand(&.{
        "tar", "--concatenate", "--file=raylib.tar", "raylib/submodule.tar",
    });
    concat.step.dependOn(&submods.step);
    const rm = b.addRemoveDirTree("raylib/submodule.tar");
    rm.step.dependOn(&concat.step);
    const zip = b.addSystemCommand(&.{
        "gzip",
        "-9",
        "raylib.tar",
    });
    zip.step.dependOn(&rm.step);
    return &zip.step;
    // # archive main directory
    // git archive --format tar -o raylib.tar $@
    // # decend recursively and archive each submodule
    // git submodule --quiet foreach --recursive \
    // 	'git archive --format tar --prefix=$displaypath/ -o submodule.tar HEAD'
    // # concatenate with main archive
    // TOPDIR=$(pwd) git submodule --quiet foreach --recursive 'cd $TOPDIR; tar --concatenate --file=raylib.tar $displaypath/submodule.tar; rm -fv $displaypath/submodule.tar'
    // gzip -9 raylib.tar
}
