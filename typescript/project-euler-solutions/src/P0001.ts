// Typescript: Multiples of 3 and 5

// Problem 1
// If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

// Find the sum of all the multiples of 3 or 5 below 1000.

import {sum, filter, range} from 'ramda';
import {Common} from './common';

export class P0001 {
  static sumAllMultiplesOfBelow(a: number, b: number, below: number): number {
    return sum(
      filter(
        (n: number) => Common.isMultipleOf(n, a) || Common.isMultipleOf(n, b),
        range(1, below)
      )
    );
  }
}
