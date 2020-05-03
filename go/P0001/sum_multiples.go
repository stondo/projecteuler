package main

func sumAllMultiplesOfBelow(a uint64, b uint64, below uint64) uint64 {
	result := uint64(0)
	for i := uint64(1); i < below; i++ {
		if i%a == 0 || i%b == 0 {
			result = result + i
		}
	}

	return result
}
