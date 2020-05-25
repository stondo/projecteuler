module P0017Spec where

import P0017 (countLetters)
import Test.Hspec (Spec, describe, context, it, shouldBe)

-- |Required for auto-discpvery
spec :: Spec
spec =
  describe "Project Euler Problem 17 Solution" $ do

    let oneToTen = ["one","two","three","four","five","six","seven","eight","nine","ten"]
    let elevenToNineteen = ["eleven","twelve","thirteen","fourteen","fifteen","sixteen","seventeen","eighteen","nineteen"]
    let twenties = ["twenty","twenty-one","twenty-two","twenty-three","twenty-four","twenty-five","twenty-six","twenty-seven","twenty-eight","twenty-nine"]
    let thirties = ["thirty","thirty-one","thirty-two","thirty-three","thirty-four","thirty-five","thirty-six","thirty-seven","thirty-eight","thirty-nine"]
    let forties = ["forty","forty-one","forty-two","forty-three","forty-four","forty-five","forty-six","forty-seven","forty-eight","forty-nine"]
    let fifties = ["fifty","fifty-one","fifty-two","fifty-three","fifty-four","fifty-five","fifty-six","fifty-seven","fifty-eight","fifty-nine"]
    let sixties = ["sixty","sixty-one","sixty-two","sixty-three","sixty-four","sixty-five","sixty-six","sixty-seven","sixty-eight","sixty-nine"]
    let seventies = ["seventy","seventy-one","seventy-two","seventy-three","seventy-four","seventy-five","seventy-six","seventy-seven","seventy-eight","seventy-nine"]
    let eighties = ["eighty", "eighty-one","eighty-two","eighty-three","eighty-four","eighty-five","eighty-six","eighty-seven","eighty-eight","eighty-nine"]
    let nineties = ["ninety","ninety-one","ninety-two","ninety-three","ninety-four","ninety-five","ninety-six","ninety-seven","ninety-eight","ninety-nine"]
    
    let and = " and "

    let oneToNinetyNine = oneToTen ++ elevenToNineteen ++ twenties ++ thirties ++ forties ++ fifties ++ sixties ++ seventies ++ eighties ++ nineties
    let hundred = " hundred"
    let hundreds =  [n ++ hundred| n <- oneToTen, n /= "ten"]
    let oneThousand = "one thousand"

    let oneToOneThousandInLetters = oneThousand : oneToNinetyNine ++ hundreds ++ [h ++ and ++ n | n <- oneToNinetyNine, h <- hundreds]


    describe "If the numbers 1 to 5 are written out in words: one, two, three, four, five, then" $ do
      it "there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total." $ do
         show (countLetters $ take 5 oneToTen) `shouldBe` "19"

    describe "If the numbers from 1 to 1000 are written out in words, then" $ do
      it "there are 21124 letters used in total." $ do
         show (countLetters oneToOneThousandInLetters) `shouldBe` "21124"
-- 