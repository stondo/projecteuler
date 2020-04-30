module Solution
    ( largestPalindromeProduct
    , subsequencesOfSize
    , primeFactors
    , partitions
    , unique
    ) where

import Data.Char(intToDigit)   
import Control.Monad ( filterM )     

toInt :: Float -> Int
toInt = round

maybeHead :: [a] -> Maybe a
maybeHead []    = Nothing
maybeHead (h:_) = Just h

unique :: [Int] -> [Int]
unique xs = [x | (x,y) <- zip xs [0..], x `notElem` take y xs]

primeFactors :: Int -> [Int] -> [Int]
primeFactors n acc
        | n `mod` 2 == 0 = primeFactors (n `div` 2) (2 : acc)
        | otherwise      = case mhead of 
                            Just (h, hs)  -> primeFactors h hs
                            Nothing -> n : acc
        where sqrtRoundedPlusOne = round sqrt_n_plus_one
              sqrt_n_plus_one = sqrt (fromIntegral n) + 1
              mhead =  maybeHead ([(n `div` i, i : acc) | i <- [3, 5..sqrtRoundedPlusOne], n `mod` i == 0])

subsequencesOfSize :: Int -> [a] -> [[a]]
subsequencesOfSize n xs = let l = length xs
                          in if n>l then [] else subsequencesBySize xs !! (l-n)
 where
   subsequencesBySize [] = [[[]]]
   subsequencesBySize (x:xs) = let next = subsequencesBySize xs
                             in zipWith (++) ([]:next) (map (map (x:)) next ++ [[]])              

largestPalindromeProduct :: Int -> Int
largestPalindromeProduct n = head [prod | prod <- [start, start - 1..end], isPalindrome prod && isPalindromeProductOfNDigit n prod]
  where upperBound = 10^n - 1
        lowerBound = 10^(n - 1)
        start = upperBound*upperBound
        end   = lowerBound*lowerBound
        isPalindrome m = show m == reverse (show m)

isPalindromeProductOfNDigit :: Int -> Int -> Bool
isPalindromeProductOfNDigit n pali = length (filter (==pali) prod) == 1
  where pf = primeFactors pali []
        sets = [map product p | p <- partitions pf, length p == 2]
        fs = filter (\f -> head f < 10^n && head (tail f) < 10^n) sets
        prod = map product fs

partitions :: [a] -> [[[a]]]
partitions [] = [[]]
partitions (x:xs) = expand x $ partitions xs where
    expand :: a -> [[[a]]] -> [[[a]]]
    expand x = concatMap (extend x)

    extend :: a -> [[a]] -> [[[a]]]
    extend x [] = [[[x]]]
    extend x (y:ys) = ((x:y):ys) : map (y:) (extend x ys)

-- partition :: [a] -> [([a], [a])]
-- partition xs = zip list (reverse list)
--     where list = filterM (const [True, False]) xs