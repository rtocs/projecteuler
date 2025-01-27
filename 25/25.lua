local function add(n1, n2)
	local ret = {}
	i = 1
	j = 1

	local overFlow = 0
	while i <= #n1 and j <= #n2 do
		local curr = overFlow + n1[i] + n2[j]
		overFlow = 0
		i = i + 1
		j = j + 1

		if curr >= 10 then
			curr = curr - 10
			overFlow = 1
		end
		table.insert(ret, curr)
	end

	while i <= #n1 do
		local curr = overFlow + n1[i]
		overFlow = 0
		if curr >= 10 then
			curr = curr - 10
			overFlow = 1
		end
		i = i + 1
		table.insert(ret, curr)
	end

	while j <= #n2 do
		local curr = overFlow + n2[j]
		overFlow = 0
		if curr >= 10 then
			curr = curr - 10
			overFlow = 1
		end
		j = j + 1
		table.insert(ret, curr)
	end
	if overFlow == 1 then
		table.insert(ret, 1)
	end

	return ret
end

local prv = { 1 }
local prvPrv = { 1 }
local ret = 2

while #prv < 1000 do
	sum = add(prv, prvPrv)
	prvPrv = prv
	prv = sum
	ret = ret + 1
end

print(ret)
