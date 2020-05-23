module P0015Spec where

import P0015 (countRoutes)
import Test.Hspec (Spec, describe, context, it, shouldBe)

-- |Required for auto-discpvery
spec :: Spec
spec =
  describe "Project Euler Problem 15 Solution" $ do

    describe "In a 2x2 grid starting from (0,0) and moving only right and down" $ do
      it "The number of existing routes is: 6" $ do
         show (countRoutes 2) `shouldBe` "6"

    describe "In a 20x20 grid starting from (0,0) and moving only right and down" $ do
      it "The number of existing routes is: 137846528820" $ do
         show (countRoutes 20) `shouldBe` "137846528820"