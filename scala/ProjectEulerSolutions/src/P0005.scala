package P0005

import scala.language.postfixOps

// Smallest multiple
// Problem 5
// 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

// What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
object Solution {
  private def isDivisibleByAllBelow(m: Int, n: Int): Boolean =
    (m to 2 by -1).foldRight(true) {
      case (i, acc) => n % i == 0 && acc
    }

  def smallestIntegerEvenlyDivByAnyBelow(m: Int) = {
    def maybeNumIsDivisibleByAllBelow(n: Int): Option[Int] =
      if (isDivisibleByAllBelow(m, n)) Some(n) else None

    LazyList
      .from(1)
      .flatMap(maybeNumIsDivisibleByAllBelow _ andThen (_.toList)) head
  }
}
