import { P0001 } from '../src/P0001';

describe('Helpers', () => {
  test('The sum of the multiples of 3 and 5 below 10 should be 23', () => {
    const ans = P0001.sumAllMultiplesOfBelow(3, 5, 10);
    expect(ans).toBe(23);
  });

  test('The sum of the multiples of 3 and 5 below 1000 should be 233168', () => {
    const ans = P0001.sumAllMultiplesOfBelow(3, 5, 1000);
    expect(ans).toBe(233168);
  });
});
