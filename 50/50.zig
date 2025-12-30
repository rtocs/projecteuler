const std = @import("std");

fn isPrime(n: i64) bool {
    if (n == 1) {
        return false;
    }

    if (n == 2) {
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

pub fn main() !void {
    var curr_sum: i64 = 0;
    const max_val: i64 = 1000000;

    var curr_primes: i64 = 0;
    var max_primes: i64 = 0;
    var max_primes_num: i64 = 0;

    var primes: [max_val]i64 = undefined;
    @memset(&primes, 0);
    var arr_len: usize = 0;

    for (0..max_val) |_i| {
        const i: i64 = @intCast(_i);
        if (isPrime(i)) {
            primes[arr_len] = i;
            arr_len += 1;
        }
    }

    for (0..arr_len) |_i| {
        const i = primes[_i];
        curr_primes = 1;
        curr_sum = i;

        for ((_i + 1)..arr_len) |_j| {
            const j = primes[_j];
            curr_primes += 1;
            curr_sum += j;
            if (curr_sum > max_val) {
                break;
            }

            if (curr_primes > max_primes and isPrime(curr_sum)) {
                max_primes = curr_primes;
                max_primes_num = curr_sum;
            }
        }
    }
    std.debug.print("{d}\n", .{max_primes_num});
}
