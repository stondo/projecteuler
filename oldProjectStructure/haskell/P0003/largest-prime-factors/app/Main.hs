module Main where

import Solution
import System.Environment (getArgs)

readMaybe :: Read a => String -> Maybe a
readMaybe s = case reads s of
                  [(val, "")] -> Just val
                  _           -> Nothing

printResult :: Int -> Int -> IO ()
printResult n ans = print ("The lagest prime factor of " ++ show n ++ " is: " ++ show ans)

printError :: IO ()
printError = putStrLn "error: exactly one positive integer needed"

main :: IO ()
main = do 
    args <- getArgs
    case args of
        [n] -> 
            case mn of
                Just i -> printResult i (largestPrimeFactor i)
                _      -> printError
                where mn = readMaybe n :: Maybe Int
        _ -> printError