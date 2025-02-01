package main

func main() {
	divLoopLen := func(divisor, dividend int) int {
		visted := map[int]struct{}{}
		c := 0
		startOfLoop := -1

		nextNum := func() {
			val := dividend / divisor

			if val == 0 {
				if startOfLoop != -1 {
					c += 1
				}
				dividend = dividend * 10
				return
			}

			dividend = dividend % divisor
			if dividend == 0 {
				c = 0
				return
			}

			if _, ok := visted[dividend]; ok {
				if startOfLoop == dividend {
					dividend = 0
					return
				}

				if startOfLoop == -1 {
					c = 1
					startOfLoop = dividend
				}
				c += 1
			}

			visted[dividend] = struct{}{}
			dividend *= 10
		}

		for dividend != 0 {
			nextNum()
		}
		return c
	}

	ret := 0
	for i := 1; i <= 1000; i++ {
		val := divLoopLen(i, 1)
		ret = max(ret, val)

	}
	println(ret)
}
