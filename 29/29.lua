local ret = {}

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

for a = 2, 100, 1 do
	val = tostring(a)
	for b = 2, 100, 1 do
		val = multiply(val, a)
		if not ret[val] then
			ret[val] = true
		end
	end
end

local count = 0

for k, _ in pairs(ret) do
	count = 1 + count
end

print(count)
