module P0020Spec where

import P0020 (sumOfDigitsInFactorial)
import Test.Hspec (Spec, describe, context, it, shouldBe)

-- |Required for auto-discpvery
spec :: Spec
spec =
  describe "Project Euler Problem 20 Solution" $ do

    describe "Find the sum of the digits in the number 10!" $ do
      it "The sum of the digits in the number 10! is: 27" $ do
         show (sumOfDigitsInFactorial 10) `shouldBe` "27"

    describe "Find the sum of the digits in the number 100!" $ do
      it "The sum of the digits in the number 100! is: 648" $ do
         show (sumOfDigitsInFactorial 100) `shouldBe` "648"
