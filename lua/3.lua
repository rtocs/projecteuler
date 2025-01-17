local num = 600851475143

local sqr = math.sqrt(num)

local max = 3

local i = 3

while i < sqr do
	while num % i == 0 do
		max = math.max(max, i)
		num = num / i
	end
	i = i + 2
end

print(max)
