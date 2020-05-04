package test.P0005Spec

import org.scalatest._
import P0005.Solution._

class P0005Spec extends FlatSpec {

  "The smallest number that can be divided by each of the numbers from 1 to 10 without any remainder should" should "be 2520" in {
    val ans = smallestIntegerEvenlyDivByAnyBelow(10)
    assert(ans === 2520)
  }

  "The smallest number that can be divided by each of the numbers from 1 to 20 without any remainder should" should "be 232792560" in {
    val ans = smallestIntegerEvenlyDivByAnyBelow(20)
    assert(ans === 232792560)
  }
}
