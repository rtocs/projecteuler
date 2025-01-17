local sum = "1"
local ret = 0

local function multiply(s, n)
	local ret = ""
	local overFlow = 0
	for c in string.gmatch(string.reverse(s), ".") do
		local val = tostring(tonumber(c) * n + overFlow)
		if #val > 1 then
			overFlow = tonumber(string.sub(val, 1, #val - 1))
		else
			overFlow = 0
		end
		ret = string.sub(val, #val, #val) .. ret
	end

	if overFlow > 0 then
		ret = tostring(overFlow) .. ret
	end

	return ret
end

for i = 1, 100, 1 do
	sum = multiply(sum, i)
end

for i in string.gmatch(sum, ".") do
	ret = ret + tonumber(i)
end

print(ret)
