-- Largest palindrome product
-- Problem 4
-- A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

-- Find the largest palindrome made from the product of two 3-digit numbers.

module P0004
    ( largestPalindromeProductOfNDigit
    , subsequencesOfSize
    , primeFactors
    , partitions
    , unique
    , isPalindromeProductOfNDigit
    ) where


import Common (maybeHead, primeFactors, partitions, subsequencesOfSize, unique)
import Data.Char(intToDigit)   
import Control.Monad ( filterM )
              

largestPalindromeProductOfNDigit :: Int -> Int
largestPalindromeProductOfNDigit n = head [prod | prod <- [start, start - 1..end], isPalindrome prod && isPalindromeProductOfNDigit n prod]
  where upperBound = 10^n - 1
        lowerBound = 10^(n - 1)
        start = upperBound*upperBound
        end   = lowerBound*lowerBound
        isPalindrome m = show m == reverse (show m)

isPalindromeProductOfNDigit :: Int -> Int -> Bool
isPalindromeProductOfNDigit n pali =  not (null prods) && (maximum prods == pali)
  where upperBound = 10^n
        pf = primeFactors pali
        sets = [map product p | p <- partitions pf, length p == 2]
        fs = filter (\f -> head f < upperBound && head (tail f) < upperBound) sets
        prods = map product fs

