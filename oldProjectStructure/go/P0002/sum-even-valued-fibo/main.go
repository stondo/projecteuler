package main

import (
	"flag"
	"fmt"
)

var (
	below = flag.Uint64("below", 0, "max Fibonacci number to stop the sum of the even terms to")
)

func main() {
	flag.Parse()
	ans := sumEvenFibonacciUntil(*below)
	fmt.Println("The sum of the even-valued terms of the Fibonacci sequence below", *below, "is:", ans)
}
