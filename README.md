# zig_use_c

## build

```bash
cd enum/lib
zig build
```

## test

```bash
cd enum/lib
zig build test
```

## note

this statement was missing for the whole thing to succeed:

```zig
lib_unit_tests.addLibraryPath(b.path(lib.installed_path orelse ""));
```
