package main

import(
	"os"
	"io"
	"strings"
)

func main(){
    file, err := os.Open("words.txt")
    if err != nil {
        panic("?")
    }
    defer file.Close()
    b, err := io.ReadAll(file)
    strs := strings.Split(string(b), ",")
    m := 0
    for _, s := range strs {
	    m = max(m, len(s))
    }

    triNumbers := map[int]struct{}{}
    for i := range ((m - 2) * 26){
	    num := int((i*(i + 1))/ 2)
	    triNumbers[num] = struct{}{}
    }

    sumOfWord := func(s string) int {
	    sum := 0
	    for _, b := range s{
		    sum += int(b) - 64
	    }
	    return sum - 68 + (2 * 64)
    }

    ret := 0
    for _, w := range strs{
	    n := sumOfWord(w)
	    if _, ok := triNumbers[n]; ok{
		    ret += 1
	    }
    }

    println(ret)

}
