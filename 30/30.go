package main

import (
	"strconv"
	"strings"
)

func main() {
	pow := func(n, p int) int {
		if p == 0{
			return 1
		}

		ret := n
		for 
	}

	isSumOfFifthPower := func(n int) bool {
		s := strconv.Itoa(n)
		nums := strings.Split(s, "")
		sum := 0
		for _, v := range nums {
			val, _ := strconv.Atoi(v)

			sum += val * *5
		}
	}
}
