local function isPrime(n)
	if n % 2 == 0 or n % 3 == 0 then
		return false
	end

	local curr = 5
	local max = math.sqrt(n)

	while curr <= max do
		if n % curr == 0 then
			return false
		end
		curr = curr + 2
	end
	return true
end

local ret = 2 + 3
local val = 3

while val < 2000000 do
	val = val + 2
	if isPrime(val) then
		ret = ret + val
	end
end

print(ret)
