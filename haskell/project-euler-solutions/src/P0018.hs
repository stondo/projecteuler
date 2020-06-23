{-# LANGUAGE DataKinds #-}
-- Maximum path sum I

-- Problem 18
-- By starting at the top of the triangle below and moving to adjacent numbers on the row below, the maximum total from top to bottom is 23.

--    3
--   7 4
--  2 4 6
-- 8 5 9 3

-- That is, 3 + 7 + 4 + 9 = 23.

-- Find the maximum total from top to bottom of the triangle below:

--                75
--               95 64
--              17 47 82
--             18 35 87 10
--            20 04 82 47 65
--           19 01 23 75 03 34
--          88 02 77 73 07 63 67
--         99 65 04 28 06 16 70 92
--        41 41 26 56 83 40 80 70 33
--       41 48 72 33 47 32 37 16 94 29
--      53 71 44 65 25 43 91 52 97 51 14
--     70 11 33 28 77 73 17 78 39 68 17 57
--    91 71 52 38 17 14 91 43 58 50 27 29 48
--   63 66 04 68 89 53 67 30 73 16 69 87 40 31
--  04 62 98 27 23 09 70 98 73 93 38 53 60 04 23

-- NOTE: As there are only 16384 routes, it is possible to solve this problem by trying every route. However, Problem 67,
--       is the same challenge with a triangle containing one-hundred rows; it cannot be solved by brute force, and requires a clever method! ;o)

module P0018
    ( findMaxTopBottomTotal
    , buildTreeOfInt
    , buildMatrixFromList
    ) where
    
    
import Data.List (elemIndex)
import Data.Maybe (fromMaybe, fromJust)


-- data Tree = Leaf | Node Int Tree Tree deriving Show

-- 3 7 4 2 4 6 8 5 9 3
-- buildTreeOfIntFromList :: [Int] -> Tree
-- buildTreeOfIntFromList ns = growTree (Node (head ns) Leaf Leaf) 1 (tail ns)
--   where growTree :: Tree -> [Int] -> Int -> Tree
--         growTree t [] _                = t
--         growTree (Node n t1 t2) ns lvl = Node n (growTree (Node (head elems)) (Node (head $ tail elems)) ) ()
--           where elems = take (lvl+1) ns
--                 nexts = drop (lvl+1) ns


-- buildTreeOfIntFromList (h:t) = Node h Leaf Leaf

-- data Tree a = TNil | Node a (Tree a) (Tree a) deriving Show

-- buildTreeOfInt :: [Int] -> Tree Int
-- buildTreeOfInt ns = growTree (Node (head ns) TNil TNil) 1 (tail ns)
--   where growTree :: Tree Int -> Int -> [Int] -> Tree Int
--         growTree (Node a t1 t2) n arr 
--                 | null arr                  = Node a t1 t2
--                 | otherwise                 = Node a (growTree (Node (head t1elems) TNil) (n+1) (drop (n+1) arr))
--                     where t1elems = take (n+1) arr
--                           t2elems = drop (n+1) arr


data Tree a = Nil| Node [a] (Tree a) deriving Show

buildTreeOfInt :: [Int] -> Tree Int
buildTreeOfInt ns = growTree (Node [head ns] Nil) 1 (tail ns)
  where growTree :: Tree Int -> Int -> [Int] -> Tree Int
        growTree (Node a tmul) n arr 
                | null arr                  = Node a tmul
                | (length arr - n+1) <= n+3 = Node a (Node arr Nil)
                | otherwise                 = Node a (growTree (Node (take (n+1) arr) Nil) (n+1) (drop (n+1) arr))


-- findMaxTopBottomTotal :: Tree Int -> Int
-- findMaxTopBottomTotal Nil = 0
-- findMaxTopBottomTotal (Node as tmul) = go (Node as tmul) 0
--   where go :: Tree Int -> Int -> Int
--         go Nil _               = 0
--         go (Node [a] tmul) _   = a + go tmul 0
--         go (Node as tmul) idx  = max + go tmul maxIdx
--           where (max, maxIdx) = if as!!idx >= as!!(idx+1) then (as!!idx, idx) else (as!!(idx+1), idx+1)



buildMatrixFromList :: [Int] -> [[Int]]
buildMatrixFromList ns = go ns 1
  where go :: [Int] -> Int -> [[Int]]
        go [] _ = []
        go ns n | length ns >= length ts = go (drop n ns) (n+1) ++ [ts]
                | otherwise = []
          where ts = take n ns


findMaxTopBottomTotal :: [[Int]] -> Int
findMaxTopBottomTotal [as,bs] = if (head as + head bs) > (head (tail as) + head bs) then head as + head bs else head (tail as) + head bs
findMaxTopBottomTotal (as:t) = findMaxTopBottomTotal ([if e + as!!elIdx > e + as!!(elIdx+1) then e + as!!elIdx else e + as!!(elIdx+1) | e <- elems, let elIdx = fromJust $ elemIndex e elems] : tail t)
  where elems = head t


-- findMaxTopBottomTotal :: [[Int]] -> Int
-- findMaxTopBottomTotal ns = go ns 0
--   where go :: [[Int]] -> Int -> Int
--         go [] _ = 0
--         go ([a]:t) idx = a + go t 0            
--         go (as:t) idx = max + go t maxIdx            
--           where (max, maxIdx) = if as!!idx >= as!!(idx+1) then (as!!idx, idx) else (as!!(idx+1), idx+1)
