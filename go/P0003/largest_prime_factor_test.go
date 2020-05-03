package main

import (
	"fmt"
	"testing"
)

func Equal(a, b []uint64) bool {
	if len(a) != len(b) {
		return false
	}
	for i, v := range a {
		if v != b[i] {
			return false
		}
	}
	return true
}

func TestIsDivisibleBy(t *testing.T) {
	ans := isDivisibleBy(27, 3)
	if ans != true {
		t.Errorf("isDivisibleBy(27, 3) = %t; want true", ans)
	}
}

func TestPrimeFactors(t *testing.T) {
	ans := primeFactors(uint64(12), nil)
	expected := make([]uint64, 3)
	expected = append(expected, uint64(2))
	expected = append(expected, uint64(2))
	expected = append(expected, uint64(3))

	if Equal(ans, expected) {
		t.Errorf("primeFactors(12) = %d; want [2, 2, 3]", ans)
	}
}

func TestLargestPrimeFactor1(t *testing.T) {
	ans := largestPrimeFactor(13195)

	if ans != uint64(29) {
		t.Errorf("largestPrimeFactor(13195) = %d; want 29", ans)
	}
}

func TestLargestPrimeFactor2(t *testing.T) {
	ans := largestPrimeFactor(600851475143)

	if ans != uint64(6857) {
		t.Errorf("largestPrimeFactor(600851475143) = %d; want 6857", ans)
	}
}

func BenchmarkLargestPrimeFactors(b *testing.B) {
	fmt.Println(largestPrimeFactor(600851475143))
}
