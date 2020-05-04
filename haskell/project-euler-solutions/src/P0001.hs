-- Multiples of 3 and 5
-- Problem 1
-- If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

-- Find the sum of all the multiples of 3 or 5 below 1000.

module P0001
    ( sumAllMultiplesOfBelow
    ) where

import Common (isMultipleOf)

sumAllMultiplesOfBelow :: Int -> Int -> Int -> Int
sumAllMultiplesOfBelow a b below = sum(filter (\n -> isMultipleOf n a || isMultipleOf n b) [1..below - 1])