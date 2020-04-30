module Main where

import Solution
import System.Environment (getArgs)

readMaybe :: Read a => String -> Maybe a
readMaybe s = case reads s of
                  [(val, "")] -> Just val
                  _           -> Nothing

printResult :: Int -> Int -> IO ()
printResult a ans = print ("the largest palindrome of the product of " ++ show a ++ "-digit number is: " ++ show ans)

printError :: IO ()
printError = putStrLn "error: exactly one positive integers needed"

main :: IO ()
main = do 
    args <- getArgs
    case args of
        [a] -> 
            case ma of
                Just a  -> printResult a (largestPalindromeProduct a)
                _                             -> printError
                where ma = readMaybe a :: Maybe Int                      
        _ -> printError