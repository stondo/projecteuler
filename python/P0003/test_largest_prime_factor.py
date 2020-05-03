import largest_prime_factor
import unittest


class TestLargestPrimeFactor(unittest.TestCase):
    """
    Test primeFactors and largestPrimeFactor functions from the largest_prime_factor library
    """

    def test_prime_factors(self):
        """
        Test that the prime factor of 13195 are [5,7,13,29]
        """
        result = largest_prime_factor.primeFactors(13195)
        self.assertEqual(result, [5, 7, 13, 29])

    def test_largest_prime_factor(self):
        """
        Test that the largestPrimeFactor of 600851475143 is 6857
        """
        result = largest_prime_factor.largestPrimeFactor(600851475143)
        self.assertEqual(result, 6857)


if __name__ == '__main__':
    unittest.main()
