local ret = 0

local a = 0
local b = 0
local c = 0

for i = 1, 500, 1 do
	a = i
	for j = i + 1, 500, 1 do
		b = j
		c = math.sqrt((a * a) + (b * b))
		if a + b + c == 1000 then
			print(a * b * c)
		end
	end
end
