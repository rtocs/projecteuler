local ret = 2

local prvfib1 = 1
local prvfib2 = 2

local currfib = 0

while currfib < 4000000 do
	currfib = prvfib1 + prvfib2
	prvfib1, prvfib2 = prvfib2, currfib

	if currfib % 2 == 0 and currfib < 4000000 then
		ret = currfib + ret
	end
end

print(ret)
