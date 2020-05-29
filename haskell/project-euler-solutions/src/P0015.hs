-- Lattice paths
  
-- Problem 15
-- Starting in the top left corner of a 2×2 grid, and only being able to move to the right and down, there are exactly 6 routes to the bottom right corner.


-- How many such routes are there through a 20×20 grid?

module P0015
    ( countRoutes
    ) where

import Common (binomial)      


countRoutes :: Int -> Integer
countRoutes n = binomial (n*2) n

-- countRoutes :: Integer -> Integer
-- countRoutes n = go r (n-1) [1]
--   where r   = [2..n+1]
--         go :: [Integer] -> Integer -> [Integer] -> Integer
--         go _ 0 _        = last r
--         go [] loop acc  
--                         | (loop-1) == 0 = last acc 
--                         | otherwise     = go (tail acc) (loop-1) [1]
--         go row loop acc = go (tail row) loop (acc ++ [head row + last acc])


-- Too slow for big grids

-- {-# LANGUAGE DataKinds #-}

-- data Tree a = Nil| Node a (Tree a) (Tree a) deriving Show

-- growTree :: Tree (Int, Int) -> Int -> Tree (Int, Int)
-- growTree Nil n = growTree (Node (0,0) Nil Nil) n
-- growTree (Node (a,b) t1 t2) n                         
--                             | a < n && b < n = Node (a,b) (growTree (Node (a+1,b) Nil Nil) n) (growTree (Node (a,b+1) Nil Nil) n)
--                             | a < n          = Node (a,b) (growTree (Node (a+1,b) Nil Nil) n) Nil
--                             | b < n          = Node (a,b) Nil (growTree (Node (a,b+1) Nil Nil) n)
--                             | otherwise      = Node (a,b) t1 t2


-- countPathInTreeOfSize :: Tree (Int, Int) -> Int -> Int
-- countPathInTreeOfSize Nil n = 0
-- countPathInTreeOfSize (Node (a,b) t1 t2) n
--                                          | a == n && a == b = 1 + countPathInTreeOfSize t1 n + countPathInTreeOfSize t2 n
--                                          | otherwise        = countPathInTreeOfSize t1 n + countPathInTreeOfSize t2 n


-- countPossiblePathsGoingOnlyDownAndRight :: Tree (Int, Int) -> Int -> Int
-- countPossiblePathsGoingOnlyDownAndRight Nil n = 0
-- countPossiblePathsGoingOnlyDownAndRight (Node (a,b) t1 t2) n                         
--                             | a < n && b < n = countPossiblePathsGoingOnlyDownAndRight (Node (a+1,b) Nil Nil) n + countPossiblePathsGoingOnlyDownAndRight (Node (a,b+1) Nil Nil) n
--                             | a < n          = countPossiblePathsGoingOnlyDownAndRight (Node (a+1,b) Nil Nil) n
--                             | b < n          = countPossiblePathsGoingOnlyDownAndRight (Node (a,b+1) Nil Nil) n
--                             | otherwise      = 1                                         