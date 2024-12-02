# zig_use_c

This will `zig build` ( ? ), but will fail at `zig test`.

Previously I hade the src/include directory outside the project root directory.
Then I moved it inside the `src/`.

Nothing helps.

You are welcome to send a PR for me to learn how to properly add *.h files to a zig project.

```bash
lib git:(main) zig test src/root.zig                                          
src/root.zig:3:11: error: C import failed
const c = @cImport(@cInclude("add_function.h"));
          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
referenced by:
    test.test *.h: src/root.zig:6:20
    remaining reference traces hidden; use '-freference-trace' to see all reference traces
~/zig_use_c/enum/lib/.zig-cache/o/c41778f4e420820178e5a8453998153b/cimport.h:1:10: error: 'add_function.h' file not found #include <add_function.h>
```

## build

```bash
cd enum/lib
zig build
```

## test

```bash
cd enum/lib
zig test src/root.zig
```
