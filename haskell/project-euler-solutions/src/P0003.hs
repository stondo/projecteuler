{-# LANGUAGE BlockArguments #-}

module P0003
    ( largestPrimeFactor
    ) where


import Common (maybeHead, primeFactors)

largestPrimeFactor :: Int -> Int
largestPrimeFactor n = maximum prime_factors
                where prime_factors = primeFactors n []