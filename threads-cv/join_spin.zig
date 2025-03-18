const std = @import("std");
const print = std.debug.print;

var m = std.Thread.Mutex{};
var c = std.Thread.Condition{};
var done: i64 = 0;

fn child() !void {
    print("child\n", .{});
    std.time.sleep(5 * std.time.ns_per_s);
    done = 1;
}

pub fn main() !void {
    print("parent: begin\n", .{});
    _ = try std.Thread.spawn(.{}, child, .{});

    while (done == 0) {
        //spin
    }

    print("parent: end\n", .{});
}
