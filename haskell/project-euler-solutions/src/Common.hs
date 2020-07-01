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
    , factorialMemo
    , binomial
    , tartaglia
    , Day (..)
    , Month (..)
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
getAllDivisorOf n = unique $ foldr (\i acc -> i : acc ++ [n `div` i]) [] $ filter (\i -> n `mod` i == 0) [1..end]
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
        where next = if even n then n `div` 2 else 3*n+1

factorial :: (Int -> Integer) -> Int -> Integer
factorial _ 0 = 1
factorial _ 1 = 1
factorial f n = toInteger n * f (n - 1)

factorialMemo :: Int -> Integer
factorialMemo = fix (memoize . factorial)


binomial :: Int -> Int -> Integer
binomial n k = factorialMemo n `div` (factorialMemo k * factorialMemo (n - k))


tartaglia :: Int -> [Integer]
tartaglia n = [binomial n k | k <- [0..n]]


data Month = January | February | March | April | May | June |July | August | September | October | November | December deriving (Eq, Ord, Show, Read, Bounded)
instance Enum Month where
  toEnum  0 = December
  toEnum  1 = January
  toEnum  2 = February
  toEnum  3 = March
  toEnum  4 = April
  toEnum  5 = May
  toEnum  6 = June
  toEnum  7 = July
  toEnum  8 = August
  toEnum  9 = September
  toEnum 10 = October
  toEnum 11 = November
  toEnum 12 = December
  toEnum n = toEnum (n `mod` 12)

  fromEnum January = 1
  fromEnum February = 2
  fromEnum March = 3
  fromEnum April = 4
  fromEnum May = 5
  fromEnum June = 6
  fromEnum July = 7
  fromEnum August = 8
  fromEnum September = 9
  fromEnum October = 10
  fromEnum November = 11
  fromEnum December = 12


data Day = Monday| Tuesday| Wednesday| Thursday| Friday| Saturday| Sunday deriving (Eq, Ord, Show, Read, Bounded)
instance Enum Day where
  toEnum 0 = Sunday
  toEnum 1 = Monday
  toEnum 2 = Tuesday
  toEnum 3 = Wednesday
  toEnum 4 = Thursday
  toEnum 5 = Friday
  toEnum 6 = Saturday
  toEnum 7 = Sunday -- Yes, twice.
  toEnum n = toEnum (n `mod` 7)

  fromEnum Monday = 1
  fromEnum Tuesday = 2
  fromEnum Wednesday = 3
  fromEnum Thursday = 4
  fromEnum Friday = 5
  fromEnum Saturday = 6
  fromEnum Sunday = 7