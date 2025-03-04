package main

import (
	"math"
	"strconv"
	"strings"
)

func main() {
	primes := map[int]struct{}{}
	ret := 1

	isPrime := func(num int) bool {
		if num < 0 {
			num *= -1
		}
		if num == 1 || num == 2 {
			return true
		}
		_, ok := primes[num]
		if ok {
			return true
		}
		if num%2 == 0 {
			return false
		}

		for i := 3; i < (int(math.Sqrt(float64(num))) + 1); i += 2 {
			if num%i == 0 {
				return false
			}

		}
		primes[num] = struct{}{}
		return true
	}

	isCircularPrime := func(num int) bool {
		str := strings.Split(strconv.Itoa(num), "")
		for i := range str {
			currStr := ""
			for j := i; j < len(str)+i; j++ {
				currStr += str[j%len(str)]
			}
			currNum, _ := strconv.Atoi(currStr)
			if !isPrime(currNum) {
				return false
			}
		}
		return true
	}

	for i := 3; i < 1000000; i += 2 {
		if isCircularPrime(i) {
			ret += 1
		}
	}

	println(ret)
}
