module P0010Spec where

import P0010 (sumOfPrimesBelow)
import Test.Hspec (Spec, describe, context, it, shouldBe)

-- |Required for auto-discpvery
spec :: Spec
spec =
  describe "Project Euler Problem 10 Solution" $ do

    describe "sumOfPrimesBelow 10" $ do
      it "The sum of the primes below 10 is: 17" $ do
         show (sumOfPrimesBelow 10) `shouldBe` "17"

    describe "sumOfPrimesBelow 2000000" $ do
      it "The sum of the primes below 2 million is: 142913828922" $ do
         show (sumOfPrimesBelow 2000000) `shouldBe` "142913828922"