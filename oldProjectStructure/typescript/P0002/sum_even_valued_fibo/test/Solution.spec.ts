import {Solution} from '../src/Solution';

describe('Helpers', () => {
  test('The 6th (0 based index) Fibonacci number" should "be 8', () => {
    const ans = Solution.fibonacci(6);
    expect(ans).toBe(8);
  });

  test('The sum of the even-valued terms of the Fibonacci sequence below 4000000 should be 4613732', () => {
    const ans = Solution.sumEvenValuedFiboBelow(4000000);
    expect(ans).toBe(4613732);
  });
});
