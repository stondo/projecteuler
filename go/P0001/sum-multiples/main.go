package main

import (
	"flag"
	"fmt"
)

var (
	a     = flag.Uint64("a", 0, "first multiple")
	b     = flag.Uint64("b", 0, "second multiple")
	below = flag.Uint64("below", 0, "number until sum the multiples found")
)

func main() {
	flag.Parse()
	ans := sumAllMultiplesOfBelow(*a, *b, *below)
	fmt.Println("The sum of the multiples of", *a, "and", *b, "below", *below, "is:", ans)
}
