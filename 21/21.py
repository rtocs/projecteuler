import math

ret = 0

def sumDivisors(n : int) -> int:
    sum = 0

    for i in range(1, int(math.sqrt(n)) + 1):
        if n % i == 0:
            if i * i != n :
                sum += (n / i)
            sum += i
    return sum - n

for i in range(1, 10000):
    val1 = sumDivisors(i)
    if val1 == i or val1 >= 10000:
        continue
    val2 = sumDivisors(val1)
    if i == val2 and val2 < 10000: 
        ret += val1 


print(ret)
