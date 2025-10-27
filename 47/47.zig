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

fn distinctPrimeFactorLenght(num: i64) i64 {
    var curr_prime: i64 = 2;
    var counted: bool = false;
    var len: i64 = 0;
    var n: i64 = num;
    while (true) {
        if (n == 1) {
            return len;
        } else if (isPrime(n) and !counted) {
            return len + 1;
        } else if (!isPrime(curr_prime) or @mod(n, curr_prime) != 0) {
            curr_prime += 1;
            counted = false;
        } else {
            n = @divExact(n, curr_prime);
            if (!counted) {
                len += 1;
                counted = true;
            }
        }
    }

    return n;
}

test "primeFactorLenght" {
    std.debug.print("{}\n", .{distinctPrimeFactorLenght(646)});
}

pub fn main() !void {
    var curr_num: i64 = 2;
    var count: i64 = 0;
    var ret: i64 = 0;

    while (count != 4) {
        if (distinctPrimeFactorLenght(curr_num) == 4) {
            if (count == 0) {
                ret = curr_num;
            }
            count += 1;
        } else {
            count = 0;
        }
        curr_num += 1;
    }

    std.debug.print("ret is {}\n", .{ret});
}
