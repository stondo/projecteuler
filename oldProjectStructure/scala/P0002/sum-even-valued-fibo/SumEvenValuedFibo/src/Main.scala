package main

import Solution.SumEvenValuedFibo._

object Main {
  def isAllDigit(s: String): Boolean = s forall Character.isDigit

  def areArgsNumbers(args: Array[String]) = args.foldLeft(true) {
    case (acc, arg) => isAllDigit(arg) && acc
  }

  def main(args: Array[String]): Unit = {
    if (args.length != 1 || !areArgsNumbers(args)) {
      Console.err.println("Usage: please enter 1 positive integers only")
      System.exit(1)
    } else {
      val ans = sumEvenValuedFiboBelow(args(0).toInt)
      println(s"The sum of the even-valued terms of the Fibonacci sequence below ${args(0)} is: $ans")
    }

  }

}
