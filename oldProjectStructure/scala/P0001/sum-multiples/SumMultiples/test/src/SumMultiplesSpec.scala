package test.SumMultipleSpec

import org.scalatest._
import Solution.SumMultiples._

class SumMultiplesSpec extends FlatSpec {

  "The sum of the multiples of 3 and 5 below 10" should "be 23" in {
    val ans = sumAllMultiplesOfBelow(3, 5, 10)
    assert(ans === 23)
  }

  "The sum of the multiples of 3 and 5 below 1000" should "be 233168" in {
    val ans = sumAllMultiplesOfBelow(3, 5, 1000)
    assert(ans === 233168)
  }
}