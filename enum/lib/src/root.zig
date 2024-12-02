const std = @import("std");
const testing = std.testing;
const c = @cImport(@cInclude("add_function.h"));

test "test *.h" {
    const result = c.add_function(1, 2);

    std.debug.print("result: {}\n", .{result});
}
