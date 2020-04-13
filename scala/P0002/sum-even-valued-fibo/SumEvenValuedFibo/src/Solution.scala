package Solution

object SumEvenValuedFibo {
  def fibonacci(n: Int): Int = {
    if (n == 0) 0
    else if (n == 1) 1
    else fibonacci(n - 2) + fibonacci(n - 1)
  }

  def sumEvenValuedFiboBelow(below: Int): Int =
    LazyList.from(1).map(fibonacci).filter(_ % 2 == 0).takeWhile(_ < below).sum
}
