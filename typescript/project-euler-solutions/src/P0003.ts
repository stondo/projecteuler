import {max} from 'ramda';
import {Common} from './common';

export class P0003 {
  static largestPrimeFactor(n: number): number {
    const pfactors = Common.primeFactors(n);
    let currentMax = pfactors[0];
    for (const i in pfactors) {
      if (pfactors[i] > currentMax) {
        currentMax = pfactors[i];
      }
    }

    return currentMax;
  }
}
