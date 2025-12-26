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

fn isPermutation(n1: i64, n2: i64) !bool {
    var buff_1: [4]u8 = undefined;
    var buff_2: [4]u8 = undefined;

    const v1 = try std.fmt.bufPrint(&buff_1, "{d}", .{n1});
    const v2 = try std.fmt.bufPrint(&buff_2, "{d}", .{n2});

    for (v1) |b1| {
        var found = false;
        for (v2, 0..) |b2, i| {
            if (b1 == b2) {
                found = true;
                buff_2[i] = 0;
                break;
            }
        }
        if (!found) {
            return false;
        }
    }
    return true;
}

pub fn main() !void {
    for (1000..10000) |_i| {
        const i: i64 = @intCast(_i);
        if (i == 1487) {
            continue;
        }

        if (isPrime(i)) {
            const ii = i + 3330;
            const iii = ii + 3330;
            if (ii < 10000 and iii < 10000) {
                if (try isPermutation(i, ii) and try isPermutation(i, iii)) {
                    if (isPrime(ii) and isPrime(iii)) {
                        std.debug.print("{d}", .{i});
                        std.debug.print("{d}", .{ii});
                        std.debug.print("{d}\n", .{iii});
                        return;
                    }
                }
            }
        }
    }
}
