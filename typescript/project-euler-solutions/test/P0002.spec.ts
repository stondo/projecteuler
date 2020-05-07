import {P0002} from '../src/P0002';
import {Common} from '../src/common';

describe('Helpers', () => {
  test('The 6th (0 based index) Fibonacci number" should "be 8', () => {
    const ans = Common.fibonacci(6);
    expect(ans).toBe(8);
  });

  test('The sum of the even-valued terms of the Fibonacci sequence below 4000000 should be 4613732', () => {
    const ans = P0002.sumEvenValuedFiboBelow(4000000);
    expect(ans).toBe(4613732);
  });
});
