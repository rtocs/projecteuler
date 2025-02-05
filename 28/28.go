package main

import "fmt"

func main() {

	makeSpiral := func(x, y int) [][]int {
		spiral := [][]int{}
		for _ = range x {
			spiral = append(spiral, make([]int, y))
		}

		var fill func(int, int, int)

		dir := [2]int{0, 1}

		fill = func(curr, i, j int) {
			spiral[i][j] = curr
			curr -= 1
			if dir[0]+i < x && dir[0]+i >= 0 && dir[1]+j < y && dir[1]+j >= 0 && spiral[i+dir[0]][j+dir[1]] == 0 {
				fill(curr, i+dir[0], j+dir[1])
			} else if i+1 < x && spiral[i+1][j] == 0 {
				dir = [2]int{1, 0}
				fill(curr, i+1, j)
			} else if j+1 < y && spiral[i][j+1] == 0 {
				dir = [2]int{0, 1}
				fill(curr, i, j+1)
			} else if i-1 >= 0 && spiral[i-1][j] == 0 {
				dir = [2]int{-1, 0}
				fill(curr, i-1, j)
			} else if j-1 >= 0 && spiral[i][j-1] == 0 {
				dir = [2]int{0, -1}
				fill(curr, i, j-1)
			}
		}
		fill(x*y, 0, 0)
		return spiral
	}

	arr := makeSpiral(1001, 1001)

	ret := -1

	for i := range arr {
		ret += arr[i][i]
	}

	j := len(arr) - 1
	for i := range arr {
		ret += arr[j][i]
		j -= 1
	}

	fmt.Println(ret)
}
