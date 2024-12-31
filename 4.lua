local ret = 0

local function isPali(n)
	local s1 = tostring(n)
	local s2 = tostring(n)
	return s1 == string.reverse(s2)
end

for i = 999, 100, -1 do
	for j = 999, 100, -1 do
		if isPali(i * j) then
			ret = math.max(ret, i * j)
		end
	end
end

print(ret)
