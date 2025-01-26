local prv = "1"
local prvPrv = "1"
local ret = 2

local function add(s, n)
	local ret = ""
	local overFlow = 0
	for c in string.gmatch(string.reverse(s), ".") do
		local val = tostring(tonumber(c) + n + overFlow)
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
	sum = add(prv, prvPrv)
	prvPrv = prv
	prv = sum
	print(sum)
end
