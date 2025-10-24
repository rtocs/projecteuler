const std = @import("std");

fn isPrime(n: i64) bool {
    if (n == 1 or n == 2) {
        return true;
    }

    if (@mod(n, 2) == 0) {
        return false;
    }
    const limit: i64 = @intFromFloat(@trunc(std.math.sqrt(@as(f64, @floatFromInt(n)))) + 1);
    var i: i64 = 3;

    while (i < limit) : (i += 2) {
        if (@mod(n, i) == 0) {
            return false;
        }
    }
    return true;
}
// n = prime + 2 * x**2
// prime = n - 2 * x**2
// until (2 * x**2) > n in which case we return false
fn isTrue(oddComposite :i64) bool {
    var curr_square :i64 = 1;
    while ((2 * std.math.pow(i64, curr_square, 2)) < oddComposite ) : (curr_square += 1) {
        if (isPrime(oddComposite - (2 * std.math.pow(i64, curr_square, 2)))){
            return true;
        }
    }
    return false;
}

test "isTrue" {
    std.debug.print("{}\n", .{isTrue(33)});
}

test "isPrime" {
    std.debug.print("{}\n", .{isPrime(3576805909)});
}

pub fn main() !void {
    var curr_val :i64 = 9;
    while (true) : (curr_val += 2) {
        if (!isPrime(curr_val)) {
            if (!isTrue(curr_val)) {
                std.debug.print("{}\n", .{curr_val});
                return;
            }
        }
    }
}
