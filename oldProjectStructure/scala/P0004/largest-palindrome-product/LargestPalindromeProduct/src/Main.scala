package main

import Solution.LargestPalindromeProduct._

object Main {
  def main(args: Array[String]): Unit = {
    if (args.length > 0) {
      Console.err.println(
        "Usage: no command line parameters needed."
      )
      System.exit(1)
    } else {
      val ans =
        largestPalindromeProductOfNDigit(3)
      println(
        s"The largest palindrome made from the product of two 3-digit numbers is $ans"
      )
    }

  }

}
