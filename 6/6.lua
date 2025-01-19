local ret = 0
local sum = 0

for i = 1, 100, 1 do
	ret = ret + (i * i)
	sum = sum + i
end

ret = sum * sum - ret

print(ret)
