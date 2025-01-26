curr = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

def nextVal():
    i = len(curr) - 2
    while curr[i] > curr[i + 1]:
        i -= 1

    r = len(curr) - 1
    l = i + 1

    while l < r:
        curr[l], curr[r] = curr[r], curr[l]
        l += 1
        r -= 1

    next = i
    while curr[i] >= curr[next]:
        next += 1

    curr[i], curr[next] = curr[next], curr[i]


for i in range(999999):
    nextVal()

ret = ''.join(str(x) for x in curr)
print(ret)
