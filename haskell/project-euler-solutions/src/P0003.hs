{-# LANGUAGE BlockArguments #-}

-- Largest prime factor
-- Problem 3
-- The prime factors of 13195 are 5, 7, 13 and 29.

-- What is the largest prime factor of the number 600851475143 ?

module P0003
    ( largestPrimeFactor
    ) where


import Common (maybeHead, primeFactors)

largestPrimeFactor :: Int -> Int
largestPrimeFactor n = maximum prime_factors
                where prime_factors = primeFactors n []