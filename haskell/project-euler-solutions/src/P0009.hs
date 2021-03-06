-- -- Special Pythagorean triplet

-- -- Problem 9
-- -- A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,

-- -- a^2 + b^2 = c^2
-- -- For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.

-- -- There exists exactly one Pythagorean triplet for which a + b + c = 1000.
-- -- Find the product abc.

module P0009
    ( genPythagoreanTripletsThatSumTo
    ) where

import Common (subsequencesOfSize, maybeHead, unique)


-- Optimize
genPythagoreanTripletsThatSumTo :: (Eq a, Ord a, Enum a, Floating a) => a -> [a]
genPythagoreanTripletsThatSumTo n = if not $ null triplets then head triplets else [] 
    where start      = 1
          end        = n/2
          squares    = map (^2) [start..end]
          sortedPartitions = [sub | sub <- subsequencesOfSize 3 squares, isValid sub n]
          isValid arr n = (sqa + sqb + sqc) == n && a + b == c
             where a = head arr
                   b = head $ tail arr
                   c = last arr
                   sqa = sqrt a
                   sqb = sqrt b
                   sqc = sqrt c
          triplets   = map (map sqrt) sortedPartitions