local function isDigitCancellingFraction(n1, n2)
	local s1 = string.gmatch(tostring(n1), ".")
	local arr1 = { s1(), s1() }
	local s2 = string.gmatch(tostring(n2), ".")
	local arr2 = { s2(), s2() }

	if arr2[1] == arr1[2] and arr2[2] ~= arr1[1] then
		v = tonumber(arr1[1]) / tonumber(arr2[2])
		if v == n1 / n2 then
			return true
		end
	end

	if arr2[2] == arr1[1] and arr2[1] ~= arr1[2] then
		v = tonumber(arr1[2]) / tonumber(arr2[1])
		if v == n1 / n2 then
			return true
		end
	end

	return false
end

local ret = 0

local val = 1
local denominator = 1

for i = 10, 99, 1 do
	for j = i, 99, 1 do
		if isDigitCancellingFraction(i, j) then
			val = val * i
			denominator = denominator * j
		end
	end
end

for i = val, 1, -1 do
	if val % i == 0 and denominator % i == 0 then
		print(denominator / i)
		return
	end
end
