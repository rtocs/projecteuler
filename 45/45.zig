const std = @import("std");

fn pentagonNumber(n: i64) i64 {
    const val = std.math.divExact(i64, n * ((3 * n) - 1), 2) catch {
        return 0;
    };
    return val;
}

fn triNumber(n: i64) i64 {
    const val = std.math.divExact(i64, n * (n + 1), 2) catch {
        return 0;
    };
    return val;
}

fn hexNumber(n: i64) i64 {
    return n * (2 * n - 1);
}

fn isPentagonNumber(i: i64) bool {
    var n: f64 = @floatFromInt(i);
    n = (std.math.sqrt(24 * n + 1) + 1) / 6;
    return n == @trunc(n);
}

fn isHexNumber(i: i64) bool {
    var n: f64 = @floatFromInt(i);
    n = (std.math.sqrt(8 * n + 1) + 1) / 4;
    return n == @trunc(n);
}

pub fn main() !void {
    var curr_tri: i64 = 286;
    var curr_num: i64 = triNumber(curr_tri);
    while (true) {
        if (isPentagonNumber(curr_num) and isHexNumber(curr_num)) {
            std.debug.print("{}\n", .{curr_num});
            break;
        }
        curr_tri += 1;
        curr_num = triNumber(curr_tri);
    }
}
