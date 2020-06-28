{-# LANGUAGE DataKinds #-}
-- Counting Sundays
  
-- Problem 19
-- You are given the following information, but you may prefer to do some research for yourself.

-- 1 Jan 1900 was a Monday.
-- Thirty days has September,
-- April, June and November.
-- All the rest have thirty-one,
-- Saving February alone,
-- Which has twenty-eight, rain or shine.
-- And on leap years, twenty-nine.
-- A leap year occurs on any year evenly divisible by 4, but not on a century unless it is divisible by 400.

-- How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?

module P0019
    ( isLeap
    , nextDay
    , fillMonthFrom
    , firstDayOfMonth
    , fillMonthsOfYear
    , countSundayFirst
    , getFirstDayOfYear
    , getCenturyStartEnd
    , getCenturyStartEndFromYear
    , fillYearsOfCentury
    ) where

import Common (Day(..), Month(..))    

    
isLeap :: Int -> Bool
isLeap y = not isDivisibleBy100 && isDivisibleBy4 || isDivisibleBy100 && isDivisibleBy400 && isDivisibleBy4
  where isDivisibleBy100 = y `mod` 100 == 0
        isDivisibleBy400 = y `mod` 400 == 0
        isDivisibleBy4   = y `mod`   4 == 0


nextDay :: (Day, Int) -> (Day, Int)
nextDay (d,n) = (succ d, succ n)


firstDayOfMonth :: Day -> Day
firstDayOfMonth d = fst $ nextDay (d,0) 


fillMonthFrom :: Month -> Int -> Day -> (Month, [(Day, Int)])
fillMonthFrom m n d = (m, foldl (\acc _ -> nd acc) [firstDay] [2..n])
  where firstDay = (firstDayOfMonth d, 1)
        nd acc = (nextDay $ head acc) : acc


fillMonthsOfYear :: Int -> [(Month, [(Day, Int)])]
fillMonthsOfYear y = foldl (\acc (m,d) -> (fillMonthFrom m d (firstDay m (if null acc then [] else acc)) ) : acc) [] (months `zip` monthsDay)
  where monthsDay = [31, if isLeap y then 29 else 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
        months    = [January .. December]
        firstDay :: Month -> [(Month, [(Day, Int)])] -> Day
        firstDay m lm = if m == January then getFirstDayOfYear y else firstDayOfMonth $ getLastDayOfMonth $ head lm
      

fillYearsOfCentury :: Int -> [[(Month, [(Day, Int)])]]
fillYearsOfCentury y = [fillMonthsOfYear y | y <- [cs..ce]]
  where (cs,ce) = getCenturyStartEndFromYear y


getLastDayOfMonth :: (Month, [(Day, Int)]) -> Day
getLastDayOfMonth (_, h:_) = fst h


countSundayFirst :: [(Month, [(Day, Int)])] -> Int
countSundayFirst []    = 0
countSundayFirst ((m,ds):t) = length (filter (\(d,n) -> d == Sunday && n == 1) ds) + countSundayFirst t


getCenturyStartEnd :: Int -> (Int, Int)
getCenturyStartEnd c = if c == 1 then (1,100) else ((c-1)*(10^2)+1,c*100)


getCenturyStartEndFromYear :: Int -> (Int, Int)
getCenturyStartEndFromYear y =  head $ filter (\(s,e) -> (abs(y-s) + abs(e-y)) == 99) [getCenturyStartEnd n | n <- [1..]]

    
getFirstDayOfYear :: Int -> Day
getFirstDayOfYear y | y == 1900 = janFirst1900 
                    | otherwise = getDay diff
  where (cs,ce) = getCenturyStartEndFromYear y
        janFirst1900 = Monday
        allLeapsUntil =  if y > 1900 then filter (\cy -> cy < y && isLeap cy) [1900..ce] else filter (\cy -> cy > y && isLeap cy) [y..1900]
        diff = (abs(y - 1900) + length allLeapsUntil) `mod` 7
        getDay n = case n of 
                        0 -> Monday
                        1 -> if y > 1900 then Tuesday else Sunday
                        2 -> if y > 1900 then Wednesday else Saturday
                        3 -> if y > 1900 then Thursday else Friday
                        4 -> if y > 1900 then Friday else Thursday
                        5 -> if y > 1900 then Saturday else Wednesday
                        6 -> if y > 1900 then Sunday else Tuesday