package Solution

// import scala.math.sqrt

object LargestPrimeFactor {
  def primeFactors(n: BigInt) = {
    def loop(
        n: BigInt,
        acc: List[BigInt] = List.empty[BigInt]
    ): List[BigInt] = {
      if (n % 2 == 0) loop(n / 2, 2 +: acc)
      else {
        (for {
          // i <- (3 to sqrt(n.toDouble).toInt + 1 by 2)
          i <- (3 to sqrtBigInt(n).toInt + 1 by 2)
          if (n % i == 0)
        } yield i).headOption match {
          case None    => if (n != 1) n +: acc else acc
          case Some(v) => loop(n / v, v +: acc)
        }
      }
    }

    loop(n)
  }

  def largestPrimeFactor(n: BigInt) = primeFactors(n).max

  def sqrtBigInt(n: BigInt): BigDecimal = {
    val d = BigDecimal(n)
    var a = BigDecimal(1.0)
    var b = d
    while (b - a >= 0) {
      val mid = (a + b) / 2
      if (mid * mid - d > 0) b = mid - 0.0001
      else a = mid + 0.0001
    }
    b
  }
}
