module P0001Spec where

import P0001

import Test.Hspec (Spec, describe, context, it, shouldBe)

-- |Required for auto-discpvery
spec :: Spec
spec =
  describe "Project Euler Problem1 Solution" $ do

    describe "sumAllMultiplesOfBelow 3 5 10" $ do
      it "the sum of the multiples of 3 and 5 below 10 is 23" $ do
        show (sumAllMultiplesOfBelow 3 5 10) `shouldBe` "23"

    describe "sumAllMultiplesOfBelow 3 5 1000" $ do
      it "the sum of the multiples of 3 and 5 below 1000 is 233168" $ do
        show (sumAllMultiplesOfBelow 3 5 1000) `shouldBe` "233168"