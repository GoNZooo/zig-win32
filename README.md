# zig-win32

## Linking

You will need to add something like the following to your `build.zig` depending
on what you end up using:

If you're using the `win32.c` module, most functions are annotated with their
library information, so you don't need to link anything, but at the time of
writing the `lean_and_mean` module is not annotated. With that in mind, you may
have to add build instructions like the following, depending on which functions
you use:

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
