const std = @import("std");

pub fn main() !void {
    var count: i64 = 0;
    var res: i64 = 0;

    for (0..1000) |i| {
        count += 1;
        var curr_num = count;
        const curr_power = count;
        for (0..(i)) |_| {
            curr_num = @mod((curr_num * curr_power), 10000000000);
        }
        res = @mod(res + curr_num, 10000000000);
    }
    std.debug.print("{}\n", .{res});
}
