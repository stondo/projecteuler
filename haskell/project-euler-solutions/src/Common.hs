module Common
    ( isMultipleOf
    , maybeHead
    , toInt
    , unique
    , primeFactors
    , subsequencesOfSize
    , partitions
    ) where

isMultipleOf :: Int -> Int -> Bool
isMultipleOf n m = n `mod` m == 0

maybeHead :: [a] -> Maybe a
maybeHead []    = Nothing
maybeHead (h:_) = Just h

toInt :: Float -> Int
toInt = round

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

partitions :: [a] -> [[[a]]]
partitions [] = [[]]
partitions (x:xs) = expand x $ partitions xs where
    expand :: a -> [[[a]]] -> [[[a]]]
    expand x = concatMap (extend x)

    extend :: a -> [[a]] -> [[[a]]]
    extend x [] = [[[x]]]
    extend x (y:ys) = ((x:y):ys) : map (y:) (extend x ys)                             