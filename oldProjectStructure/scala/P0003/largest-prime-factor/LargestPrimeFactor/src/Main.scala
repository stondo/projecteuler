package main

import Solution.LargestPrimeFactor._

object Main {
  def isAllDigit(s: String): Boolean = s forall Character.isDigit

  def areArgsNumbers(args: Array[String]) = args.foldLeft(true) {
    case (acc, arg) => isAllDigit(arg) && acc
  }

  def main(args: Array[String]): Unit = {
    if (args.length != 1 || !areArgsNumbers(args)) {
      Console.err.println("Usage: please enter 1 positive integer")
      System.exit(1)
    } else {
      val ans =
        largestPrimeFactor(BigInt(args(0)))
      println(
        s"The largest prime factor of ${args(0)} is: $ans"
      )
    }

  }

}
