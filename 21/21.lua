local ret = 0

local function sumDivisors(n)
	local sum = 0
	for i = 1, math.sqrt(n), 1 do
		if n % i == 0 then
			sum = sum + i
			if i * i == n then
				tot = tot - 1
			end
		end
	end
end

print(ret)
