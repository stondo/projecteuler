{-# LANGUAGE BlockArguments #-}
module Solution
    ( primeFactors
    , largestPrimeFactor
    ) where


maybeHead :: [a] -> Maybe a
maybeHead []    = Nothing
maybeHead (h:_) = Just h

primeFactors :: Int -> [Int] -> [Int]
primeFactors n acc
        | n `mod` 2 == 0 = primeFactors (n `div` 2) (2 : acc)
        | otherwise      = case mhead of 
                            Just (h, hs)  -> primeFactors h hs
                            Nothing -> n : acc
        where sqrtRoundedPlusOne = round sqrt_n_plus_one
              sqrt_n_plus_one = sqrt (fromIntegral n) + 1
              mhead =  maybeHead ([(n `div` i, i : acc) | i <- [3, 5..sqrtRoundedPlusOne], n `mod` i == 0])

largestPrimeFactor :: Int -> Int
largestPrimeFactor n = maximum prime_factors
                where prime_factors = primeFactors n []