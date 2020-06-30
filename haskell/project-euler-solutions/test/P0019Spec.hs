module P0019Spec where

import P0019 (countSundayFirst, fillYearsOfCentury)
import Test.Hspec (Spec, describe, context, it, shouldBe)
import Data.List.Split (splitOn)

-- |Required for auto-discpvery
spec :: Spec
spec =
  describe "Project Euler Problem 19 Solution" $ do

    describe "How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?" $ do
      it "The number of Sunday on the first day of the month in the XX Century is: 171" $ do
         show (countSundayFirst $ fillYearsOfCentury 20) `shouldBe` "171"
