local function isPrime(n)
	if n == 2 or n == 3 or n == 5 or n == 7 then
		return true
	end
	if n == 1 then
		return false
	end

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

local function isTruncatablePrime(n)
	if n == 2 or n == 3 or n == 5 or n == 7 or not isPrime(n) then
		return false
	end

	nStr = tostring(n)
	for i = 2, #nStr, 1 do
		if not isPrime(tonumber(string.sub(nStr, i, #nStr))) then
			return false
		end
	end

	for i = #nStr - 1, 1, -1 do
		if not isPrime(tonumber(string.sub(nStr, 1, i))) then
			return false
		end
	end
	return true
end

local ret = 0
local currVal = 0
local currTPrime = 0

while currTPrime ~= 11 do
	if isTruncatablePrime(currVal) then
		ret = ret + currVal
		currTPrime = currTPrime + 1
	end
	currVal = currVal + 1
end

print(ret)
