package main

import (
	"math"
)

func isDivisibleBy(n uint64, m uint64) bool {
	return n%m == 0
}

func primeFactors(n uint64, acc []uint64) []uint64 {
	if isDivisibleBy(n, 2) {
		acc = append(acc, 2)
		return primeFactors(n/2, acc)
	}

	for i := float64(3); i < math.Sqrt(float64(n)); i += 2 {
		ui := uint64(i)
		if isDivisibleBy(n, ui) {
			acc = append(acc, ui)
			return primeFactors(n/ui, acc)
		}
	}

	return append(acc, n)
}

func largestPrimeFactor(pfactors []uint64) uint64 {
	max := pfactors[0]
	for _, v := range pfactors {
		if v > max {
			max = v
		}
	}

	return max
}
