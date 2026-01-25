const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const exe = b.addExecutable(.{
        .name = "marketdata_kucoin",
        .root_module = b.createModule(.{
            .root_source_file = b.path("src/main.zig"),
            .target = target,
            .optimize = optimize,
            .imports = &.{
                // Here "marketdata_kucoin" is the name you will use in your source code to
                // import this module (e.g. `@import("marketdata_kucoin")`). The name is
                // repeated because you are allowed to rename your imports, which
                // can be extremely useful in case of collisions (which can happen
                // importing modules from different packages).
                // .{ .name = "marketdata_kucoin", .module = mod },
            },
        }),
    });

    const websocket = b.dependency("websocket", .{
        .target = target,
        .optimize = optimize,
    });
    exe.root_module.addImport("websocket", websocket.module("websocket"));

    const marketdata_relay_pub = b.dependency("marketdata_relay_pub", .{
        .target = target,
        .optimize = optimize,
    });
    exe.root_module.addImport("marketdata_relay_pub", marketdata_relay_pub.module("marketdata_relay_pub"));

    b.installArtifact(exe);

    const run_step = b.step("run", "Run the app");
    const run_cmd = b.addRunArtifact(exe);
    run_step.dependOn(&run_cmd.step);

    run_cmd.step.dependOn(b.getInstallStep());
    if (b.args) |args| {
        run_cmd.addArgs(args);
    }

    const exe_tests = b.addTest(.{
        .root_module = exe.root_module,
    });

    const run_exe_tests = b.addRunArtifact(exe_tests);

    const test_step = b.step("test", "Run tests");
    test_step.dependOn(&run_exe_tests.step);
}
