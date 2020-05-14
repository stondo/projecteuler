module P0012Spec where

import P0012 (findFirstTrianleNumWithMoreThan500Divisor)
import Test.Hspec (Spec, describe, context, it, shouldBe)

-- |Required for auto-discpvery
spec :: Spec
spec =
  describe "Project Euler Problem 12 Solution" $ do

    describe "findFirstTrianleNumWithMoreThan500Divisor 10" $ do
      it "The first triangle number that has over 500 divisors is: 76576500" $ do
         show (findFirstTrianleNumWithMoreThan500Divisor 500) `shouldBe` "Just 76576500"