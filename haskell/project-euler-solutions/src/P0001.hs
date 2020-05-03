module P0001
    ( sumAllMultiplesOfBelow
    ) where

import Common (isMultipleOf)

sumAllMultiplesOfBelow :: Int -> Int -> Int -> Int
sumAllMultiplesOfBelow a b below = sum(filter (\n -> isMultipleOf n a || isMultipleOf n b) [1..below - 1])