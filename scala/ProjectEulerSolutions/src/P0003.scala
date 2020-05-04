package P0003

import Common.Functions.primeFactors

// Scala: Largest prime factor

// Problem 3
// The prime factors of 13195 are 5, 7, 13 and 29.

// What is the largest prime factor of the number 600851475143 ?
object Solution {
  def largestPrimeFactor(n: BigInt) = primeFactors(n).max
}
