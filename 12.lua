local ret = 0

local function numOfDivisors(n)
	local tot = 0

	for i = 1, math.sqrt(n), 1 do
		if n % i == 0 then
			tot = tot + 2
			if i * i == n then
				tot = tot - 1
			end
		end
	end

	return tot
end

local curr = 0

for i = 1, 40000, 1 do
	curr = curr + i
	ret = math.max(numOfDivisors(curr), ret)

	if ret > 500 then
		ret = curr
		break
	end
end

print(ret)
