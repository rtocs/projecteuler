package main

import (
	"strconv"
	"strings"
)

func main() {
	isSumOfFifthPower := func(n int) bool {
		s := strconv.Itoa(n)
		nums := strings.Split(s, "")
		sum := 0
		for _, v := range nums {
			val, _ := strconv.Atoi(v)
			sum += (val * val * val * val * val)
			if sum > n {
				return false
			}
		}
		return sum == n
	}

	ret := 0

	pow9 := 9 * 9 * 9 * 9 * 9

	s := pow9
	m := 1

	for m < s {
		s += pow9
		m *= 10
	}

	for i := 2; i < m; i++ {
		if isSumOfFifthPower(i) {
			ret += i
		}
	}
	println(ret)
}
