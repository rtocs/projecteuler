package main

import "strconv"

func main() {

	isNumPandigitalProduct := func(val string) bool {
		if len(val) != 9 {
			return false
		}
		m := map[rune]struct{}{}

		zero := "0"

		for _, b := range val {
			if b == rune(zero[0]) {
				return false
			}
			if _, ok := m[b]; ok {
				return false
			}
			m[b] = struct{}{}
		}
		return true
	}

	added := map[int]struct{}{}
	ret := 0
	for i := 1; i < 10000; i++ {
		for j := 1; j < 100000; j++ {
			product := i * j
			val := strconv.Itoa(product) + strconv.Itoa(j) + strconv.Itoa(i)
			if len(val) > 9 {
				break
			}
			if isNumPandigitalProduct(val) {
				if _, ok := added[product]; !ok {
					added[product] = struct{}{}
					ret += product
				}
			}
		}
	}

	println(ret)
}
