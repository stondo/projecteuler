import { Solution } from '../src/Solution';

describe('Helpers', () => {
  test('The largest prime factor of 13195 should be 29', () => {
    const ans = Solution.largestPrimeFactor(13195);
    expect(ans).toBe(29);
  });

  test('The sum of the multiples of 3 and 5 below 1000 should be 233168', () => {
    const ans = Solution.largestPrimeFactor(600851475143);
    expect(ans).toBe(6857);
  });
});
