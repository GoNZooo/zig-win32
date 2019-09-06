const Builder = @import("std").build.Builder;

pub fn build(b: *Builder) void {
    const mode = b.standardReleaseOptions();
    const lib = b.addStaticLibrary("win32", "src/main.zig");
    lib.setBuildMode(mode);
    lib.install();
}
