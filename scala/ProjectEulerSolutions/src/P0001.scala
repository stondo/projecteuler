package P0001

// Scala: Multiples of 3 and 5

// Problem 1
// If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

// Find the sum of all the multiples of 3 or 5 below 1000.
object Solution {
  def sumAllMultiplesOfBelow(a: Int, b: Int, below: Int): Int =
    (1 until below).filter(n => n % a == 0 || n % b == 0).sum
}
