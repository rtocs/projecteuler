local map = {}

for line in io.lines("input.txt") do
	for name in string.gmatch(line, "%a+") do
		table.insert(map, name)
	end
end
table.sort(map)

local ret = 0
for i, val in pairs(map) do
	local v = 0
	for c in string.gmatch(val, ".") do
		v = v + string.byte(c) - 64
	end
	ret = ret + (v * i)
end

print(ret)
