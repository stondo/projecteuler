package P0004

import Common.Functions.{primeFactors, partitions, fibonacci}
import scala.language.postfixOps
import scala.math.pow

// Scala: Largest palindrome product

// Problem 4
// A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

// Find the largest palindrome made from the product of two 3-digit numbers.
object Solution {
  def largestPalindromeProductOfNDigit(n: BigInt): BigInt = {
    def isPalindrome(m: BigInt): Boolean = m.toString == m.toString.reverse

    def isPalindromeProductOfNDigit(n: BigInt, pali: BigInt): Boolean = {
      val upperBound = BigInt((pow(10, n.toDouble)).toInt)
      val pf         = primeFactors(pali)
      val sets = for {
        p <- partitions(pf)
        if p.size == 2
      } yield p.map(_.product)
      val fs = sets.filter(f => f.head < upperBound && f.tail.head < upperBound)

      fs.map(_.product).filter(_ == pali).distinct.size == 1
    }

    def isPaliAndProductOfNDigit(pali: BigInt): Option[BigInt] =
      if (isPalindrome(pali) && isPalindromeProductOfNDigit(n, pali)) Some(pali)
      else None

    val upperBound    = BigInt((pow(10, n.toDouble) - 1).toInt)
    val lowerBound    = BigInt((pow(10, n.toDouble - 1)).toInt)
    val start: BigInt = upperBound * upperBound
    val end: BigInt   = lowerBound * lowerBound

    LazyList.from[BigInt](start to end by -1) flatMap (isPaliAndProductOfNDigit _ andThen (_.toList)) head
  }
}
