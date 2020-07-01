module P0021Spec where

import P0021 (hasAmicable)
import Test.Hspec (Spec, describe, context, it, shouldBe)

-- |Required for auto-discpvery
spec :: Spec
spec =
  describe "Project Euler Problem 21 Solution" $ do

    describe "Evaluate the sum of all the amicable numbers under 10000." $ do
      it "The sum of all the amicable numbers under 10000 is: 31626" $ do
         show (sum $ filter (/= 0) [hasAmicable n | n <- [1..9999]]) `shouldBe` "31626"