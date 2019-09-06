const windows = @import("std").os.windows;
pub const c = @import("./win32/c.zig");
pub const lean_and_mean = @import("./win32/lean_and_mean.zig");

pub fn MAKEINTRESOURCEA(value: windows.INT) windows.LPSTR {
    return @ptrCast(windows.LPSTR, @intToPtr(*windows.ULONG_PTR, @intCast(windows.WORD, value)));
}

pub fn MAKEINTRESOURCEW(value: windows.INT) windows.LPSTR {
    return @ptrCast(windows.LPWSTR, @intToPtr(*windows.ULONG_PTR, @intCast(windows.WORD, value)));
}
