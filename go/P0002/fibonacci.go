package main

func fibonacci(n uint) uint64 {
	if n == 0 {
		return 0
	} else if n == 1 {
		return 1
	} else {
		return fibonacci(n-2) + fibonacci(n-1)
	}
}

func sumEvenFibonacciUntil(below uint64) uint64 {
	f := uint64(0)
	result := uint64(0)
	for i := uint(1); f < below; i++ {
		f = fibonacci(i)
		if f%2 == 0 {
			result = result + f
		}
	}

	return result
}
