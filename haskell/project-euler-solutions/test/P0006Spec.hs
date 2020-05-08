module P0006Spec where

import P0006 (differenceBetweenSumOfTheSquaresAndSquareOfTheSum)
import Test.Hspec (Spec, describe, context, it, shouldBe)

-- |Required for auto-discpvery
spec :: Spec
spec =
  describe "Project Euler Problem5 Solution" $ do

    describe "differenceBetweenSumOfTheSquaresAndSquareOfTheSum 10" $ do
      it "2640 is the difference between the sum of the squares of the first ten natural numbers and the square of the sum." $ do
         show (differenceBetweenSumOfTheSquaresAndSquareOfTheSum 10) `shouldBe` "2640"

    describe "differenceBetweenSumOfTheSquaresAndSquareOfTheSum 100" $ do
      it "25164150 is the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum." $ do
        show (differenceBetweenSumOfTheSquaresAndSquareOfTheSum 100) `shouldBe` "25164150" 