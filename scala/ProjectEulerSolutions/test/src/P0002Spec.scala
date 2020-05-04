package test.P0002Spec

import Common.Functions.fibonacci
import org.scalatest._
import P0002.Solution._

class P0002Spec extends FlatSpec {

  "The 6th (0 based index) Fibonacci number" should "be 8" in {
    val ans = fibonacci(6)
    assert(ans === 8)
  }

  "The sum of the even-valued terms of the Fibonacci sequence below below 4000000" should "be 4613732" in {
    val ans = sumEvenValuedFiboBelow(4000000)
    assert(ans === 4613732)
  }
}
