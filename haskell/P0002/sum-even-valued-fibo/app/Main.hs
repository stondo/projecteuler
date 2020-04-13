module Main where

import Solution
import System.Environment (getArgs)

readMaybe :: Read a => String -> Maybe a
readMaybe s = case reads s of
                  [(val, "")] -> Just val
                  _           -> Nothing

printResult ::Int -> Int -> IO ()
printResult below ans = print ("The sum of the even-valued terms of the Fibonacci sequence below " ++ show below ++ " is: " ++ show ans)

printError :: IO ()
printError = putStrLn "error: exactly one positive integer or zero needed."

main :: IO ()
main = do 
    args <- getArgs
    case args of
        [below] -> 
            case mbelow of
                Just below  -> printResult below (sumEvenFibonacciUntil below) -- 
                _           -> printError
                where mbelow = readMaybe below :: Maybe Int
        _ -> printError