module Solution
    ( sumEvenFibonacciUntil
    , fibonacci
    ) where

fibonacci :: Int -> Int
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci n = fibonacci(n - 2) + fibonacci(n - 1)

sumEvenFibonacciUntil :: Int -> Int
sumEvenFibonacciUntil below =  sum (takeWhile (< below) [n | i <- [1..], n <- [fibonacci 0, fibonacci i], n `mod` 2 == 0 && n /= 0])