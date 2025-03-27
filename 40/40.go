package main

import "strconv"

func main() {
	currVal := 10
	nextIndex := 10
	currIndex := 10

	ret := 1

	for currIndex <= 1000000 {
		if currIndex >= nextIndex {
			str := strconv.Itoa(currVal)
			index := currIndex - nextIndex
			val, _ := strconv.Atoi(string(str[index]))
			ret *= val
			nextIndex *= 10
		}

		v := currVal
		for v >= 10 {
			currIndex += 1
			v = v / 10
		}
		currIndex += 1
		currVal += 1
	}

	println(ret)
}
