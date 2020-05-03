module Main where

import Solution
import System.Environment (getArgs)

readMaybe :: Read a => String -> Maybe a
readMaybe s = case reads s of
                  [(val, "")] -> Just val
                  _           -> Nothing

printResult ::Int -> Int -> Int -> Int -> IO ()
printResult a b below ans = print ("The sum of the multiples of " ++ show a ++ " and " ++ show b ++ " below " ++ show below ++ " is: " ++ show ans)

printError :: IO ()
printError = putStrLn "error: exactly three positive integers needed"

main :: IO ()
main = do 
    args <- getArgs
    case args of
        [a, b, below] -> 
            case (ma, mb, mbelow) of
                (Just a, Just b, Just below)  -> printResult a b below (sumAllMultiplesOfBelow a b below)
                _                             -> printError
                where ma = readMaybe a :: Maybe Int
                      mb = readMaybe b :: Maybe Int
                      mbelow = readMaybe below :: Maybe Int
        _ -> printError