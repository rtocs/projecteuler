local function numOfTrisWithPerimeter(p)
	local ret = 0

	for a = 1, (p / 2), 1 do
		for b = a, p, 1 do
			cArea = (a * a + b * b)
			c = math.sqrt(cArea)
			if math.modf(c) == c and c + a + b == p then
				ret = ret + 1
			end
		end
	end
	return ret
end

local ret = 0
local currMax = 0

for i = 1, 1000, 1 do
	local n = numOfTrisWithPerimeter(i)
	if n > currMax then
		ret = i
		currMax = n
	end
end

print(ret)
