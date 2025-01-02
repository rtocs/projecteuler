local ret = 0

local primes = { 1, 2, 3 }

local function isPrime(n)
	for _, p in pairs(primes) do
		if n % p == 0 then
			return false
		end
	end
end

local val = 3

while table.getn(primes) ~= 10 do
	val = val + 2
	if isPrime(val) then
		table.insert(primes, val)
	end
end

ret = primes[10001]

print(ret)
