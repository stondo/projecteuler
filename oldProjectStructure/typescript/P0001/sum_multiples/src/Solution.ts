import { sum, filter, range } from 'ramda';

export class Solution {
  static sumAllMultiplesOfBelow(a: number, b: number, below: number): number {
    return sum(
      filter(
        (n: number) => this.isMultipleOf(n, a) || this.isMultipleOf(n, b),
        range(1, below)
      )
    );
  }

  private static isMultipleOf(n: number, m: number): boolean {
    return n % m === 0;
  }
}
