package main

import (
	"math"
)

func isDivisibleBy(n uint64, m uint64) bool {
	return n%m == 0
}

func primeFactors(n uint64, acc []uint64) []uint64 {
	if isDivisibleBy(n, 2) {
		return primeFactors(n/2, append(acc, 2))
	}

	for i := uint64(3); i < uint64(math.Round(math.Sqrt(float64(n)))); i += 2 {
		if isDivisibleBy(n, i) {
			return primeFactors(n/i, append(acc, i))
		}
	}

	return append(acc, n)
}

func largestPrimeFactor(n uint64) uint64 {
	acc := make([]uint64, 0)
	pfactors := primeFactors(n, acc)
	max := pfactors[0]
	for _, v := range pfactors {
		if v > max {
			max = v
		}
	}

	return max
}
