{-# LANGUAGE BlockArguments #-}
module Solution
    ( primeFactors
    , largestPrimeFactor
    ) where

isDivisibleBy :: Int -> Int -> Bool
isDivisibleBy n m = n `mod` m == 0

maybeHead :: [a] -> Maybe a
maybeHead []    = Nothing
maybeHead (h:_) = Just h

primeFactors :: Int -> [Int] -> [Int]
primeFactors n acc
        | isDivisibleBy n 2 = primeFactors (n `div` 2) (2 : acc)
        | otherwise         = case mhead of 
                                Just (h, hs)  -> primeFactors h hs
                                Nothing -> n : acc
        where sqrtRounded = round $ sqrt $ fromIntegral n
              mhead = if sqrtRounded > 5 
                  then maybeHead ([(n `div` i, i : acc) | i <- [3, 5..sqrtRounded], isDivisibleBy n i])
                  else maybeHead ([(n `div` i, i : acc) | i <- [3..5], isDivisibleBy n i])


largestPrimeFactor :: [Int] -> Int
largestPrimeFactor = maximum