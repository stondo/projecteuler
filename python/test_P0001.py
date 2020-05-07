import P0001
import unittest


class TestSumMultiples(unittest.TestCase):
    """
    Test the sumAllMultiplesOfBelow function from the sum_multiples library
    """

    def test_sum_multiples_of_3_and_5_below_10(self):
        """
        Test that the sumAllMultiplesOfBelow of 3 and 5 below 10 returns the correct total
        """
        result = P0001.sumAllMultiplesOfBelow(3, 5, 10)
        self.assertEqual(result, 23)

    def test_sum_multiples_of_3_and_5_below_1000(self):
        """
        Test that the sumAllMultiplesOfBelow of 3 and 5 below 1000 returns the correct total
        """
        result = P0001.sumAllMultiplesOfBelow(3, 5, 1000)
        self.assertEqual(result, 233168)


if __name__ == '__main__':
    unittest.main()
