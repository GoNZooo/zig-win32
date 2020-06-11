const std = @import("std");
const windows = std.os.windows;
const testing = std.testing;

pub const c = @import("./win32/c.zig");
pub const lean_and_mean = @import("./win32/lean_and_mean.zig");

pub fn makeIntResourceA(value: windows.INT) windows.LPSTR {
    return @ptrCast(windows.LPSTR, @intToPtr(*windows.ULONG_PTR, @intCast(windows.WORD, value)));
}

pub fn makeIntResourceW(value: windows.INT) windows.LPSTR {
    return @ptrCast(windows.LPWSTR, @intToPtr(*windows.ULONG_PTR, @intCast(windows.WORD, value)));
}

/// Takes the lower 32 bits of a value `x: T`. Really only meant to be used with `DWORD`-like
/// things in the Win32 API.
pub fn lowWord(comptime T: type, x: T) T {
    return x & 0xffff;
}

/// Extracts the upper 32 bits of a value `x: T`. Really only meant to be used with `DWORD`-like
/// things in the Win32 API.
pub fn highWord(comptime T: type, x: T) T {
    return (x & 0xffff0000) >> 16;
}

test "high & low word" {
    const x = 0xaaaaff0f00f0;
    const high = highWord(u64, x);
    const low = lowWord(u64, x);

    testing.expectEqual(high, 0xff0f);
    testing.expectEqual(low, 0x00f0);
}
