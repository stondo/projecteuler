package Solution

import scala.math.pow

object LargestPalindromeProduct {

  def largestPalindromeProductOfNDigit(n: Int): Int = {
    val startValue = pow(10, n).toInt - 1
    val minValue   = pow(10, n - 1).toInt
    val mid        = (startValue - minValue) / 2
    (for {
//      i <- LazyList.range(pow(10, n).toInt - 1, pow(10, n - 1).toInt, -1)
      i <- LazyList.range(pow(10, n).toInt - 1, mid - mid / 2, -1)
      j <- LazyList.range(pow(10, n).toInt - 1, mid, -1)
      prod = i * j
      // if isPalindrome(prod)
//      if isPalindromeRecursive(prod)
      if prod.toString == prod.toString.reverse
    } yield prod).max
  }

//  def largestPalindromeProductOfNDigit(n: Int): Int = {
//
//    def loop(i: Int, j: Int, minValue: Int, currentMaxValue: Int): Int =
//      (i, j, minValue, currentMaxValue) match {
//        case (a, b, _, _) if isPalindromeRecursive(a * b) => a * b
//        case (a, b, min, max) if b >= min                 => loop(a, b - 1, min, max)
//        case (a, _, min, max)                             => loop(a - 1, max - 1, min, max - 1)
//      }
//
//    val startValue = pow(10, n).toInt - 1
//    val minValue   = pow(10, n - 1).toInt
//
//    loop(startValue, startValue, minValue, startValue)
//  }

  def isPalindrome(n: Int): Boolean = {
    var m       = n
    var divisor = 1
    while (m / divisor >= 10) divisor *= 10;

    while (m != 0) {
      val leading  = m / divisor
      val trailing = m % 10

      if (leading != trailing)
        return false;

      m = (m % divisor) / 10

      divisor = divisor / 100
    }

    true
  }

  def isPalindromeRecursive(n: Int): Boolean = {
    def loop(n: Int, leading: Int, trailing: Int, divisor: Int): Boolean =
      (n, leading, trailing, divisor) match {
        case (_, l, t, _) if l != t => false
        case (n, _, _, d) if n != 0 =>
          loop((n % d) / 10, n / d, n % 10, d / 100)
        case _ => true
      }

    val divisor = findingDivisorToGetLeadingDigit(n)

    loop(n, getLeadingDigit(n, divisor), getTrailingDigit(n), divisor)
  }

  private def findingDivisorToGetLeadingDigit(n: Int, divisor: Int = 1): Int =
    (n, divisor) match {
      case (n, d) if (n / d < 10) => d
      case (n, d)                 => findingDivisorToGetLeadingDigit(n, d * 10)
    }

  private def getLeadingDigit(n: Int, divisor: Int): Int = n / divisor

  private def getTrailingDigit(n: Int): Int = n % 10

}
