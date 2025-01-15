local ret = 1

for i = 1, 100, 1 do
	ret = ret * i
end

print(string.format("%.0f", ret))
