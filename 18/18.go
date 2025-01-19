package main

import "fmt"

func main() {
	dp := [][]int{}
	dp = append(dp, []int{75})
	dp = append(dp, []int{95, 64})
	dp = append(dp, []int{17, 47, 82})
	dp = append(dp, []int{18, 35, 87, 10})
	dp = append(dp, []int{20, 04, 82, 47, 65})
	dp = append(dp, []int{19, 1, 23, 75, 3, 34})
	dp = append(dp, []int{88, 2, 77, 73, 7, 63, 67})
	dp = append(dp, []int{99, 65, 04, 28, 06, 16, 70, 92})
	dp = append(dp, []int{41, 41, 26, 56, 83, 40, 80, 70, 33})
	dp = append(dp, []int{41, 48, 72, 33, 47, 32, 37, 16, 94, 29})
	dp = append(dp, []int{53, 71, 44, 65, 25, 43, 91, 52, 97, 51, 14})
	dp = append(dp, []int{70, 11, 33, 28, 77, 73, 17, 78, 39, 68, 17, 57})
	dp = append(dp, []int{91, 71, 52, 38, 17, 14, 91, 43, 58, 50, 27, 29, 48})
	dp = append(dp, []int{63, 66, 4, 68, 89, 53, 67, 30, 73, 16, 69, 87, 40, 31})
	dp = append(dp, []int{4, 62, 98, 27, 23, 9, 70, 98, 73, 93, 38, 53, 60, 4, 23})

	for i := len(dp) - 2; i >= 0; i-- {
		for j := range len(dp[i]) {
			dp[i][j] += max(dp[i+1][j], dp[i+1][j+1])
		}
	}

	fmt.Println(dp[0][0])
}
