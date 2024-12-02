const std = @import("std");
const expect = std.testing.expect;
const c = @cImport(@cInclude("add_function.h"));

test "using *.h file in Zig" {
    const a: i32 = 1;
    const b: i32 = 2;
    const expected_result: i32 = a + b;
    const result = c.add(a, b);

    try expect(expected_result == result);
}
