package test.SumMultipleSpec

import org.scalatest._
import Solution.LargestPalindromeProduct._

class LargestPalindromeProductSpec extends FlatSpec {

  "The largest palindrome made from the product of two 2-digit numbers" should "be 9009" in {
    val ans = largestPalindromeProductOfNDigit(2)
    assert(ans === 9009)
  }

  "The largest palindrome made from the product of two 3-digit numbers" should "be 906609" in {
    val ans = largestPalindromeProductOfNDigit(3)
    assert(ans === 906609)
  }

  "The largest palindrome made from the product of two 4-digit numbers" should "be 99000099" in {
    val ans = largestPalindromeProductOfNDigit(4)
    assert(ans === 99000099)
  }

  // "The largest palindrome made from the product of two 5-digit numbers" should "be 9893443989" in {
  //   val ans = largestPalindromeProductOfNDigit(5)
  //   assert(ans === BigInt("9893443989"))
  // }

  // "The largest palindrome made from the product of two 6-digit numbers" should "be 999000000999" in {
  //   val ans = largestPalindromeProductOfNDigit(5)
  //   assert(ans === BigInt("999000000999"))
  // }

  "956459" should "not be palindrome" in {
    val ans = isPalindrome(956459)
    assert(ans === false)
  }

  "21166112" should "be palindrome" in {
    val ans = isPalindrome(21166112)
    assert(ans === true)
  }

  "956459" should "not be palindrome (recursive)" in {
    val ans = isPalindromeRecursive(956459)
    assert(ans === false)
  }

  "21166112" should "be palindrome (recursive)" in {
    val ans = isPalindromeRecursive(21166112)
    assert(ans === true)
  }

  "900099" should "not be palindrome (recursive)" in {
    val ans = isPalindromeRecursive(900099)
    assert(ans === false)
  }

}
