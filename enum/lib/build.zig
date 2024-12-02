const std = @import("std");
const allocator = std.heap.page_allocator;

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});
    const lib = b.addStaticLibrary(.{
        .name = "add_from_c",
        .root_source_file = b.path("src/root.zig"),
        .target = target,
        .optimize = optimize,
        .link_libc = true,
    });

    lib.addIncludePath(b.path("src/include"));
    b.installArtifact(lib);

    const lib_unit_tests = b.addTest(.{
        .root_source_file = b.path("src/root.zig"),
        .target = target,
        .optimize = optimize,
        .link_libc = true,
    });

    lib_unit_tests.addLibraryPath(b.path(lib.installed_path orelse ""));
    lib_unit_tests.addIncludePath(b.path("src/include"));

    const run_lib_unit_tests = b.addRunArtifact(lib_unit_tests);
    const test_step = b.step("test", "Run unit tests");

    test_step.dependOn(&run_lib_unit_tests.step);
    test_step.dependOn(&lib.step);
}
