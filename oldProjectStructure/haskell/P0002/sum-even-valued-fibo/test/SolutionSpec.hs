module SolutionSpec where

import Solution

import Test.Hspec (Spec, describe, context, it, shouldBe)

-- |Required for auto-discpvery
spec :: Spec
spec =
  describe "Project Euler Problem2 Solution" $ do

    describe "fibonacci 6" $ do
      it "calculates the 6th (0 index based) Fibonacci's number" $ do
        show (fibonacci 6) `shouldBe` "8"

    describe "sumEvenFibonacciUntil 4000000" $ do
      it "calculates the sum of the even-valued terms of Fibonacci below 4000000" $ do
        show (sumEvenFibonacciUntil 4000000) `shouldBe` "4613732"

