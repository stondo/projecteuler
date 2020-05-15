module P0013Spec where

import P0013 (findTheFirstTenDigitOfTheSumOf100_50digitNumbers, oneHundred50digitNumbers)
import Test.Hspec (Spec, describe, context, it, shouldBe)

-- |Required for auto-discpvery
spec :: Spec
spec =
  describe "Project Euler Problem 13 Solution" $ do

    describe "findTheFirstTenDigitOfTheSumOf100_50digitNumbers" $ do
      it "The first ten digits of the sum of the following one-hundred 50-digit numbers are: 5537376230" $ do
         findTheFirstTenDigitOfTheSumOf100_50digitNumbers `shouldBe` "5537376230"