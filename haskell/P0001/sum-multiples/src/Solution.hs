module Solution
    ( sumAllMultiplesOfBelow
    ) where

isMultipleOf :: Int -> Int -> Bool
isMultipleOf n m = n `mod` m == 0

sumAllMultiplesOfBelow :: Int -> Int -> Int -> Int
sumAllMultiplesOfBelow a b below = sum(filter (\n -> isMultipleOf n a || isMultipleOf n b) [1..below - 1])
