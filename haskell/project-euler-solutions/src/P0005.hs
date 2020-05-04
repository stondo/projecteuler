-- Smallest multiple
-- Problem 5
-- 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

-- What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

module P0005 
    (smallestIntegerEvenlyDivByAnyBelow
    ) where

smallestIntegerEvenlyDivByAnyBelow :: Int -> Int
smallestIntegerEvenlyDivByAnyBelow m = head [n | n <- [1..], foldr (\i acc -> (n `mod` i == 0) && acc) True [2..m]]    