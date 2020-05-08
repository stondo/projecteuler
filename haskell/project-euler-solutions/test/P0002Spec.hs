module P0002Spec where

import P0002

import Test.Hspec (Spec, describe, context, it, shouldBe)

-- |Required for auto-discpvery
spec :: Spec
spec =
  describe "Project Euler Problem 2 Solution" $ do

    describe "fibonacci 6" $ do
      it "the 6th (0 index based) Fibonacci's number is 8" $ do
        show (fibonacci 6) `shouldBe` "8"

    describe "sumEvenFibonacciUntil 4000000" $ do
      it "the sum of the even-valued terms of Fibonacci below 4000000 is 4613732" $ do
        show (sumEvenFibonacciUntil 4000000) `shouldBe` "4613732"