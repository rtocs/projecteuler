local function len(n)
	local curr = n
	local ret = 0
	while curr ~= 1 do
		if curr % 2 == 0 then
			curr = curr / 2
		else
			curr = (curr * 3) + 1
		end
		ret = ret + 1
	end
	return ret
end

local m = 0
local ret = 0

for i = 1, 999999, 1 do
	local v = len(i)
	if v > m then
		ret = i
		m = v
	end
end

print(ret)
