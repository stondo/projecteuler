module P0016Spec where

import P0016 (sumOfDigit)
import Test.Hspec (Spec, describe, context, it, shouldBe)

-- |Required for auto-discpvery
spec :: Spec
spec =
  describe "Project Euler Problem 16 Solution" $ do

    describe "sumOfDigit" $ do
      it "The sum of the digits of the number 2^15 is 26" $ do
         show (sumOfDigit (2^15)) `shouldBe` "26"

    describe "sumOfDigit" $ do
      it "The sum of the digits of the number 2^1000 is 1366" $ do
         show (sumOfDigit (2^1000)) `shouldBe` "1366"         