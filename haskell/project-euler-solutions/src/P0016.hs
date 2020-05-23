-- Power digit sum

-- Problem 16
-- 2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.

-- What is the sum of the digits of the number 2^1000?

module P0016
    ( sumOfDigit
    ) where

import Data.Char (digitToInt)

sumOfDigit :: Integer -> Integer
sumOfDigit n = toInteger $ foldr (\c acc -> digitToInt c + acc) 0 (show n)