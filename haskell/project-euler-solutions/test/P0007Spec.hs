module P0007Spec where

import P0007 (getNthPrime)
import Test.Hspec (Spec, describe, context, it, shouldBe)

-- |Required for auto-discpvery
spec :: Spec
spec =
  describe "Project Euler Problem5 Solution" $ do

    describe "getNthPrime 6" $ do
      it "The 6th prime number is: 13" $ do
         show (getNthPrime 6) `shouldBe` "13"

    describe "getNthPrime 10001" $ do
      it "The 6th prime number is: 10001" $ do
         show (getNthPrime 10001) `shouldBe` "104743"