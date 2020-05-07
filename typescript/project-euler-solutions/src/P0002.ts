import {sum} from 'ramda';
import {Common} from './common';

export class P0002 {
  static *evenValuedFibo(): IterableIterator<number> {
    let idx = 0;
    while (true) {
      const fib = Common.fibonacci(idx);
      if (fib % 2 === 0) yield fib;
      idx += 1;
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
    return sum([...P0002.takeWhileBelowGen(below, P0002.evenValuedFibo())]);
  }
}
