package main

import "fmt"

func main() {
	dp := map[[2]int]int{}

	var paths func(int, int) int
	paths = func(x, y int) int {
		if x == 20 && y == 20 {
			return 1
		}
		if x > 20 || y > 20 {
			return 0
		}

		if v, ok := dp[[2]int{x, y}]; ok {
			return v
		}
		v := 0

		v += paths(x+1, y)
		v += paths(x, y+1)
		dp[[2]int{x, y}] = v
		return v
	}

	fmt.Println(paths(0, 0))
}
