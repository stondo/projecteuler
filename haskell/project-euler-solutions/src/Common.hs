module Common
    ( isMultipleOf
    , maybeHead
    , toInt
    , fibonacciMemo
    , unique
    , primeFactors
    , subsequencesOfSize
    , partitions
    , primes
    , isInt
    , getNthTriangleNum
    , getAllDivisorOf
    , collatz
    ) where


import Data.Function (fix)


memoize :: (Int -> a) -> (Int -> a)
memoize f = (map f [0 ..] !!)

fibonacci :: (Int -> Integer) -> Int -> Integer
fibonacci f 0 = 0
fibonacci f 1 = 1
fibonacci f n = f (n - 1) + f (n - 2)

fibonacciMemo :: Int -> Integer
fibonacciMemo = fix (memoize . fibonacci)

isInt :: RealFrac a => a -> Bool
isInt x = x == fromInteger (round x)        

isMultipleOf :: Int -> Int -> Bool
isMultipleOf n m = n `mod` m == 0

maybeHead :: [a] -> Maybe a
maybeHead []    = Nothing
maybeHead (h:_) = Just h

toInt :: Float -> Int
toInt = round

unique :: (Eq a, Ord a, Enum a) => [a] -> [a]
unique xs = [x | (x,y) <- zip xs [0..], x `notElem` take y xs]

getAllDivisorOf :: Integer -> [Integer]
getAllDivisorOf n = foldr (\i acc -> i : acc ++ [n `div` i]) [] $ filter (\i -> n `mod` i == 0) [1..end]
  where end               = ceiling $ sqrt (fromInteger n)

primeFactors :: Integral a => a -> [a]
primeFactors 1 = []
primeFactors n = let divisors = dropWhile ((/= 0) . mod n) [2 .. ceiling $ sqrt $ fromIntegral n]
                 in let prime = if null divisors then n else head divisors
                    in (prime :) $ primeFactors $ div n prime

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


primes :: [Integer]
primes = 2:([3..] `minus` composites)
    where
    composites = union [multiples p | p <- primes]
    multiples n = map (n*) [n..]
    (x:xs) `minus` (y:ys) | x < y = x:(xs `minus` (y:ys))
                          | x == y = xs `minus` ys
                          | x > y = (x:xs) `minus` ys
    union = foldr merge []
        where merge (x:xs) ys = x:merge' xs ys
              merge' (x:xs) (y:ys) | x < y = x:merge' xs (y:ys)
                                   | x == y = x:merge' xs ys
                                   | x > y = y:merge' (x:xs) ys

getNthTriangleNum ::Integer -> Integer
getNthTriangleNum n = n * (n + 1) `div` 2

-- n → n/2 (n is even)
-- n → 3n + 1 (n is odd)
collatz :: Int -> [Int]
collatz 1 = [1]
collatz n = n : collatz next
        where next = if n `mod` 2 == 0 then n `div` 2 else 3*n+1