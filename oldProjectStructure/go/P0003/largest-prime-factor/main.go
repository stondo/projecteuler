package main

import (
	"flag"
	"fmt"
)

var (
	n = flag.Uint64("n", 0, "number to find the largest prime factor of")
)

func main() {
	flag.Parse()
	ans := largestPrimeFactor(*n)
	fmt.Println("The largest prime factor of", *n, "is:", ans)
}
