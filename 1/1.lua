local ret = 0

for i = 1, 999, 1 do
	if i % 3 == 0 or i % 5 == 0 then
		ret = ret + i
	end
end

print(ret)
