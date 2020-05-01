package Solution

import scala.math.{pow, sqrt}
import scala.language.postfixOps

object LargestPalindromeProduct {

  def partitions[T](list: List[T]): List[List[List[T]]] =
    list match {
      case Nil | _ :: Nil => // 0/1 elements
        List(List(list))
      case head :: tail => // 2+ elements
        partitions(tail).flatMap(part => {
          val joins =
            part.indices.map(i =>
              part.zip(LazyList.from(0)).map {
                case (p, j) =>
                  if (i == j) head +: p else p
              }
            )

          (List(head) +: part) +: joins
        })
    }

  def primeFactors(n: BigInt) = {
    def loop(
        n: BigInt,
        acc: List[BigInt] = List.empty[BigInt]
    ): List[BigInt] = {
      if (n % 2 == 0) loop(n / 2, 2 +: acc)
      else {
        (for {
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

  def largestPalindromeProductOfNDigit(n: BigInt): BigInt = {
    def isPalindrome(m: BigInt): Boolean = m.toString == m.toString.reverse

    def isPalindromeProductOfNDigit(n: BigInt, pali: BigInt): Boolean = {

      val upperBound = BigInt((pow(10, n.toDouble)).toInt)
      val pf = primeFactors(pali)
      val sets = for {
        p <- partitions(pf)
        if p.size == 2
      } yield p.map(_.product)
      val fs = sets.filter(f => f.head < upperBound && f.tail.head < upperBound)

      fs.map(_.product).filter(_ == pali).distinct.size == 1
    }

    def isPaliAndProductOfNDigit(pali: BigInt): Option[BigInt] =
      if (isPalindrome(pali) && isPalindromeProductOfNDigit(n, pali)) Some(pali)
      else None

    val upperBound = BigInt((pow(10, n.toDouble) - 1).toInt)
    val lowerBound = BigInt((pow(10, n.toDouble - 1)).toInt)
    val start: BigInt = upperBound * upperBound
    val end: BigInt = lowerBound * lowerBound

    LazyList.from[BigInt](start to end by -1) flatMap (isPaliAndProductOfNDigit _ andThen (_.toList)) head
  }

  def isPalindrome(n: Int): Boolean = {
    var m = n
    var divisor = 1
    while (m / divisor >= 10) divisor *= 10;

    while (m != 0) {
      val leading = m / divisor
      val trailing = m % 10

      if (leading != trailing)
        return false;

      m = (m % divisor) / 10

      divisor = divisor / 100
    }

    true
  }

  def isPalindromeRecursive(n: Int): Boolean = {
    def loop(n: Int, leading: Int, trailing: Int, divisor: Int): Boolean =
      (n, leading, trailing, divisor) match {
        case (_, l, t, _) if l != t => false
        case (n, _, _, d) if n != 0 =>
          loop((n % d) / 10, n / d, n % 10, d / 100)
        case _ => true
      }

    val divisor = findingDivisorToGetLeadingDigit(n)

    loop(n, getLeadingDigit(n, divisor), getTrailingDigit(n), divisor)
  }

  private def findingDivisorToGetLeadingDigit(n: Int, divisor: Int = 1): Int =
    (n, divisor) match {
      case (n, d) if (n / d < 10) => d
      case (n, d)                 => findingDivisorToGetLeadingDigit(n, d * 10)
    }

  private def getLeadingDigit(n: Int, divisor: Int): Int = n / divisor

  private def getTrailingDigit(n: Int): Int = n % 10

}
