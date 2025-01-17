local ret = 0

local num = 2520

while true do
	num = num + 2

	for i = 3, 20, 1 do
		if num % i ~= 0 then
			goto continue
		end
		if i == 20 then
			print(num)
			return
		end
	end
	::continue::
end
