import {Solution} from '../src/Solution';

describe('Helpers', () => {
  test('The sum of the multiples of 3 and 5 below 10 should be 23', () => {
    const ans = Solution.sumAllMultiplesOfBelow(3, 5, 10);
    expect(ans).toBe(23);
  });

  test('The sum of the multiples of 3 and 5 below 1000 should be 233168', () => {
    const ans = Solution.sumAllMultiplesOfBelow(3, 5, 1000);
    expect(ans).toBe(233168);
  });
});
