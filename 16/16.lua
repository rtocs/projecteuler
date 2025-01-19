local ret = 0

local num = "1"

local function double(val)
	local ret = ""
	local overFlow = 0
	for i = 1, #val, 1 do
		local v = tonumber(string.sub(val, i, i)) * 2 + overFlow
		local s = tostring(v)
		ret = ret .. tostring(string.sub(s, #s, #s))
		if v > 9 then
			overFlow = 1
		else
			overFlow = 0
		end
	end
	if overFlow == 1 then
		ret = ret .. tostring(overFlow)
	end
	return ret
end

for i = 1, 1000, 1 do
	num = double(num)
end

for i = 1, #num, 1 do
	ret = ret + tonumber(string.sub(num, i, i))
end

print(ret)
