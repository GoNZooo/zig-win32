# zig-win32

## Linking

You will need to add something like the following to your `build.zig` depending
on what you end up using:

```zig
const exe = b.addExecutable("executable-name", "src/main.zig");
exe.addPackagePath("win32", "./dependencies/zig-win32/src/main.zig");
exe.linkSystemLibrary("c");
exe.linkSystemLibrary("gdi32");
exe.linkSystemLibrary("user32");
exe.linkSystemLibrary("kernel32");
```

## Usage in files

A simple import will do it, access the sub-namespaces with `c` and
`lean_and_mean`:

```zig
const win32 = @import("win32");
_ = win32.c.MessageBoxA(...);
```

Or import one of the sub-namespaces directly:

```zig
const win32 = @import("win32").lean_and_mean;
_ = win32.MessageBoxA(...);
```

## Macros not available in the FFI files

`MAKEINTRESOURCE{A,W}` is not available in the generated files, but is available
in the top namespace:

```zig
const win32 = @import("win32");
const resource: windows.LPSTR = win32.MAKEINTRESOURCEA(32512);
```