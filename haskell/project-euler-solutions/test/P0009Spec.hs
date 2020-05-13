module P0009Spec where

import P0009 (genPythagoreanTripletsThatSumTo)
import Test.Hspec (Spec, describe, context, it, shouldBe)

-- |Required for auto-discpvery
spec :: Spec
spec =
  describe "Project Euler Problem 9 Solution" $ do

    describe "genPythagoreanTripletsThatSumToN and find their products" $ do
      it "There exists exactly one Pythagorean triplet for which a + b + c = 1000 and the product abc is: 31875000" $ do
        show (product $ map (sqrt) $ genPythagoreanTripletsThatSumTo 1000) `shouldBe` "3.1875e7"