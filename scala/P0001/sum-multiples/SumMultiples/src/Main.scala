package main

import Solution.SumMultiples._

object Main {
  def isAllDigit(s: String): Boolean = s forall Character.isDigit

  def areArgsNumbers(args: Array[String]) = args.foldLeft(true) {
    case (acc, arg) => isAllDigit(arg) && acc
  }

  def main(args: Array[String]): Unit = {
    if (args.length != 3 || !areArgsNumbers(args)) {
      Console.err.println("Usage: please enter 3 positive integers only")
      System.exit(1)
    } else {
      val ans = sumAllMultiplesOfBelow(args(0).toInt, args(1).toInt, args(2).toInt)
      println(s"The sum of the multiples of ${args(0)} and ${args(1)} below ${args(2)} is: $ans")
    }

  }

}
