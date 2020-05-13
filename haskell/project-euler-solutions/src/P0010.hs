-- Summation of primes

-- Problem 10
-- The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

-- Find the sum of all the primes below two million.

module P0010
    ( sumOfPrimesBelow
    ) where

import Common (primes)

sumOfPrimesBelow :: Integer -> Integer
sumOfPrimesBelow n = sum $ takeWhile (<n) primes