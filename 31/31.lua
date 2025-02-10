local ret = 0
local coins = { 200, 100, 50, 20, 10, 5, 2, 1 }

local function greedy(curr, i)
	if curr == 200 then
		ret = ret + 1
		return
	end
	if curr > 200 then
		return
	end

	if i == #coins + 1 then
		return
	end

	while curr < 200 do
		greedy(curr, i + 1)
		curr = curr + coins[i]
		if curr == 200 then
			ret = ret + 1
			break
		end
	end
end

greedy(0, 1)

print(ret)
