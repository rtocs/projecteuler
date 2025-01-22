package main

import (
	"math"
)

func main() {
	m := map[int]struct{}{}

	sumProperDivisors := func(n int) int {
		ret := 0
		for i := range int(math.Sqrt(float64(n)) + 1) {
			if i == 0 {
				continue
			}
			if n%i == 0 {
				if i*i != n {
					ret += n / i
				}
				ret += i
			}
		}
		return ret - n
	}

	for i := 1; i < 28124; i++ {
		if sumProperDivisors(i) > i {
			m[i] = struct{}{}
		}
	}

	isSum := func(n int) bool {
		for k, _ := range m {
			if k < n {
				if _, ok := m[n-k]; ok {
					return true
				}
			}
		}
		return false
	}

	ret := 0
	for i := 1; i < 28124; i++ {
		if !isSum(i) {
			ret += i
		}
	}
	print(ret)
}
