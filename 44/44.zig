const std = @import("std");

fn pentagonNumber(n: i64) !i64 {
    return try std.math.divExact(i64, n * ((3 * n) - 1), 2);
}

fn isPentagonNumber(i: i64) bool {
    var n: f64 = @floatFromInt(i);
    n = (std.math.sqrt(24 * n + 1) + 1) / 6;
    return n == @trunc(n);
}

test "isPentagonNumber" {
    const num = 117;
    try std.testing.expect(isPentagonNumber(num));
}

test "pentagonNumber" {
    const num = try pentagonNumber(7);
    try std.testing.expectEqual(70, num);
}

pub fn main() !void {
    var curr_count: i64 = 1;
    var next_count: i64 = 2;
    var curr: i64 = try pentagonNumber(curr_count);
    var next: i64 = try pentagonNumber(next_count);
    while (true) {
        var diff = next - curr;
        if (isPentagonNumber(curr + next)) {
            if (isPentagonNumber((curr + next) + next)) {
                std.debug.print("{}\n", .{curr});
                break;
            }
        }
        if (isPentagonNumber(next - curr)) {
            if (isPentagonNumber(next + (next - curr))) {
                std.debug.print("{}\n", .{curr});
                break;
            }
        }
        if (diff > curr) {
            curr_count += 1;
            next_count = curr_count + 1;
            curr = try pentagonNumber(curr_count);
            next = try pentagonNumber(next_count);
            diff = next - curr;
        } else {
            next_count += 1;
            next = try pentagonNumber(next_count);
        }
    }
}
