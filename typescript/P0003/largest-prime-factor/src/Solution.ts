import { max } from 'ramda';

export class Solution {
  static primeFactors(n: number, acc: number[] = []): number[] {
    if (n % 2 === 0) {
      acc.push(2)
      return this.primeFactors(n / 2, acc)
    } else {
      for (let i = 3; i < Math.floor(Math.sqrt(n) + 1); i = i + 2) {
        if (n % i === 0) {
          acc.push(i)
          return this.primeFactors(n / i, acc)
        }
      }

      acc.push(n)
      return acc
    }
  }

  static largestPrimeFactor(n: number): number {
    const pfactors = this.primeFactors(n)
    let currentMax = pfactors[0]
    for (const i in pfactors) {
      if (pfactors[i] > currentMax) {
        currentMax = pfactors[i]
      }
    }

    return currentMax
  }
}
