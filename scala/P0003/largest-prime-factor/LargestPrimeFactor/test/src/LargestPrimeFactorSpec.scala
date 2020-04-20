package test.SumMultipleSpec

import org.scalatest._
import Solution.LargestPrimeFactor._

class LargestPrimeFactorSpec extends FlatSpec {

  "The largest prime factor of 13195 should" should "be 29" in {
    val ans = largestPrimeFactor(13195)
    assert(ans === 29)
  }

  "The largest prime factor of 600851475143 should" should "be 6857" in {
    val ans = largestPrimeFactor(BigInt("600851475143"))
    assert(ans === 6857)
  }
}
