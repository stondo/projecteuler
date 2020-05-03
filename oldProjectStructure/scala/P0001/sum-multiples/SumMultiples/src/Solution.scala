package Solution

object SumMultiples {
  def sumAllMultiplesOfBelow(a: Int, b: Int, below: Int): Int =
    (1 until below).filter(n => n % a == 0 || n % b == 0).sum
}
