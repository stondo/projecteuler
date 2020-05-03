import { sum } from 'ramda';

export class Solution {
  static fibonacci(n: number): number {
    if (n === 0) return 0
    else if (n === 1) return 1
    else return this.fibonacci(n - 2) + this.fibonacci(n - 1)
  }

  static *evenValuedFibo(): IterableIterator<number> {
    let idx = 0
    while (true) {
      const fib = Solution.fibonacci(idx);
      if (fib % 2 === 0)
        yield fib;
      idx += 1
    }
  }

  static *takeWhileBelowGen(below: number, iter: IterableIterator<number>) {
    for (const val of iter) {
      if (val >= below) {
        return;
      }
      yield val;
    }
  }

  static sumEvenValuedFiboBelow(below: number) {
    return  sum([...Solution.takeWhileBelowGen(below, Solution.evenValuedFibo())]);
  }
}