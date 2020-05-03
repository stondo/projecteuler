package main

import (
	"fmt"
	"testing"
)

func TestFibonacci0(t *testing.T) {
	ans := fibonacci(0)
	if ans != 0 {
		t.Errorf("fibonacci(0) = %d; want 0", ans)
	}
}

func TestFibonacci1(t *testing.T) {
	ans := fibonacci(1)
	if ans != 1 {
		t.Errorf("fibonacci(1) = %d; want 1", ans)
	}
}

func TestFibonacci2(t *testing.T) {
	ans := fibonacci(2)
	if ans != 1 {
		t.Errorf("fibonacci(2) = %d; want 1", ans)
	}
}

func TestFibonacci3(t *testing.T) {
	ans := fibonacci(3)
	if ans != 2 {
		t.Errorf("fibonacci(3) = %d; want 2", ans)
	}
}

func TestFibonacci33(t *testing.T) {
	ans := fibonacci(33)
	if ans != 3524578 {
		t.Errorf("fibonacci(33) = %d; want 3524578", ans)
	}
}

func TestSumEvenFibonacciUntil(t *testing.T) {
	ans := sumEvenFibonacciUntil(4000000)
	if ans != 4613732 {
		t.Errorf("sumEvenFibonacciUntil(4000000) = %d; want 4613732", ans)
	}
}

func BenchmarkSumEvenFibonacciUntil(b *testing.B) {
	fmt.Println(sumEvenFibonacciUntil(4000000))
}
func BenchmarkFibonacci35(b *testing.B) {
	fmt.Println(fibonacci(35))
}
