package main

import (
	"fmt"
	"testing"
)

func TestSumAllMultiplesOf3And5Below10(t *testing.T) {
	ans := sumAllMultiplesOfBelow(3, 5, 10)
	if ans != 23 {
		t.Errorf("sumAllMultiplesOfBelow(3, 5, 10) = %d; want 23", ans)
	}
}

func TestSumAllMultiplesOf3And5Below1000(t *testing.T) {
	ans := sumAllMultiplesOfBelow(3, 5, 1000)
	if ans != 233168 {
		t.Errorf("sumAllMultiplesOfBelow(3, 5, 1000) = %d; want 233168", ans)
	}
}

func BenchmarkSumAllMultiplesOf3And5Below1000(b *testing.B) {
	fmt.Println(sumAllMultiplesOfBelow(3, 5, 1000))
}
