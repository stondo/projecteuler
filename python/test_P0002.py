import P0002
from common_funcs import fibonacci
import unittest


class TestSumEvenValuedFibo(unittest.TestCase):
    """
    Test the fibonacci and sumEvenFibonacciUntil function from the sum_even_valued_fibo library
    """

    def test_fibonacci(self):
        """
        Test that the sumAllMultiplesOfBelow of 3 and 5 below 10 returns the correct total
        """
        result = fibonacci(6)
        self.assertEqual(result, 8)

    def test_sum_even_valued_fibo_below_4000000(self):
        """
        Test that the sumAllMultiplesOfBelow of 3 and 5 below 1000 returns the correct total
        """
        result = P0002.sumEvenFibonacciUntil(4000000)
        self.assertEqual(result, 4613732)


if __name__ == '__main__':
    unittest.main()
