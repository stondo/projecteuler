package Solution

import scala.math.pow

object LargestPalindromeProduct {

  def largestPalindromeProductOfNDigit(n: Int): Int = {
    (for {
      i <- LazyList.range(10, pow(10, n).toInt)
      j <- LazyList.range(10, pow(10, n).toInt)
      prod = i * j
      // if isPalindrome(prod)
      if isPalindromeRecursive(prod)
      // if (prod.toString == prod.toString.reverse)
    } yield prod).max
  }

  def isPalindrome(n: Int): Boolean = {
    var m = n
    var divisor = 1
    while (m / divisor >= 10)
      divisor *= 10;

    while (m != 0) {
      val leading = m / divisor
      val trailing = m % 10

      // If first and last digit
      // not same return false
      if (leading != trailing)
        return false;

      // Removing the leading and trailing
      // digit from number
      m = (m % divisor) / 10

      // Reducing divisor by sa factor
      // of 2 as 2 digits are dropped
      divisor = divisor / 100
    }

    true
  }

  def isPalindromeRecursive(n: Int): Boolean = {
    def loop(n: Int, leading: Int, trailing: Int, divisor: Int): Boolean =
      (n, leading, trailing, divisor) match {
        case (_, t, l, _) if t != l => false
        case (n, _, _, d) if n != 0 =>
          loop((n % d) / 10, n/d, n%10, d/100)
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
