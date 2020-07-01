-- Names scores

-- Problem 22
-- Using names.txt (right click and 'Save Link/Target As...'), a 46K text file containing over five-thousand first names, begin by sorting it into alphabetical order.
-- Then working out the alphabetical value for each name, multiply this value by its alphabetical position in the list to obtain a name score.

-- For example, when the list is sorted into alphabetical order, COLIN, which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list.
-- So, COLIN would obtain a score of 938 × 53 = 49714.

-- What is the total of all the name scores in the file?

module P0022
    ( totalScoreFromString
    , totalScoreFromFile
    ) where

import System.IO
import Data.List.Split (splitOn)
import Data.List (sort)

totalScoreFromFile :: FilePath -> IO Int
totalScoreFromFile path = do
        namesTxt <- openFile path ReadMode
        line <- hGetLine namesTxt
        hClose namesTxt
        return $ totalScoreFromString line
    where 


totalScoreFromString :: String -> Int
totalScoreFromString str = sum [s*i | (s,i) <- zip namesScores [1..]]
    where lettersAndValues = zip ['A' .. 'Z'] [1..]
          getLetterScore l = snd $ head $ filter (\(c,n) -> c == l) lettersAndValues
          sortedNames = sort $ map (\s -> read s :: String) $ splitOn (",") str
          namesScores = foldr (\w acc -> (sum $ (map (getLetterScore) w)) : acc) [] sortedNames