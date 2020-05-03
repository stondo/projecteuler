module P0003Spec where

import P0003
import Common (primeFactors)

import Test.Hspec (Spec, describe, context, it, shouldBe)

-- |Required for auto-discpvery
spec :: Spec
spec =
  describe "Project Euler Problem3 Solution" $ do

    describe "primeFactors 13195" $ do
      it "the prime factor of 13195 are [29,13,7,5]" $ do
         show (primeFactors 13195 []) `shouldBe` "[29,13,7,5]"

    describe "largestPrimeFactor 600851475143" $ do
      it "the largest prime factor of 600851475143 is 6857" $ do
        show (largestPrimeFactor 600851475143) `shouldBe` "6857" 