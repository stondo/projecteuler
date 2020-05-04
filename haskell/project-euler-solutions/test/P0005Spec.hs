module P0005Spec where

import P0005 (smallestIntegerEvenlyDivByAnyBelow)
import Test.Hspec (Spec, describe, context, it, shouldBe)

-- |Required for auto-discpvery
spec :: Spec
spec =
  describe "Project Euler Problem5 Solution" $ do

    describe "smallestIntegerEvenlyDivByAnyBelow 10" $ do
      it "2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder." $ do
         show (smallestIntegerEvenlyDivByAnyBelow 10) `shouldBe` "2520"

    describe "smallestIntegerEvenlyDivByAnyBelow 20" $ do
      it "232792560 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder." $ do
        show (smallestIntegerEvenlyDivByAnyBelow 20) `shouldBe` "232792560" 