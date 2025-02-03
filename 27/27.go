package main

import (
	"math"
)

func main() {

	isPrime := func(num int) bool {
		if num < 0 {
			num *= -1
		}
		if num == 1 || num == 2 {
			return true
		}
		if num%2 == 0 {
			return false
		}

		for i := 3; i < int(math.Sqrt(float64(num))); i += 2 {
			if num%i == 0 {
				return false
			}

		}
		return true
	}

	consecutivePrimes := func(a, b int) int {
		n := 0
		ret := 0
		v := (n*n + a*n + b)

		for isPrime(v) {
			n += 1
			ret += 1
			v = (n*n + a*n + b)
		}

		return ret
	}

	maxLen := 0
	ret := 0

	for a := -999; a < 1000; a++ {
		for b := -1000; b <= 1000; b++ {
			l := consecutivePrimes(a, b)
			if l >= maxLen {
				ret = a * b
				maxLen = l
			}
		}
	}
	println(ret)

}
