module P0004Spec where

import P0004

import Test.Hspec (Spec, describe, context, it, shouldBe)

-- |Required for auto-discpvery
spec :: Spec
spec =
  describe "Project Euler Problem 4 Solution" $ do

    describe "largestPalindromeProduct 2" $ do
      it "the largest palindrome of the product of 2-digit number is 9009" $ do
        show (largestPalindromeProductOfNDigit 2) `shouldBe` "9009"

    describe "largestPalindromeProduct 3" $ do
      it "the largest palindrome of the product of 3-digit number is 906609" $ do
        show (largestPalindromeProductOfNDigit 3) `shouldBe` "906609"

    describe "largestPalindromeProduct 4" $ do
      it "the largest palindrome of the product of 4-digit number is 99000099" $ do
        show (largestPalindromeProductOfNDigit 4) `shouldBe` "99000099" 
        
    describe "largestPalindromeProduct 5" $ do
        it "the largest palindrome of the product of 5-digit numberis 9966006699" $ do
          show (largestPalindromeProductOfNDigit 5) `shouldBe` "9966006699"

    describe "largestPalindromeProduct 6" $ do
        it "find the largest palindrome of the product of 6-digit number is 999000000999" $ do
          show (largestPalindromeProductOfNDigit 6) `shouldBe` "999000000999"

    describe "primeFactors 99" $ do
      it "the prime factors of 99 are [11,3,3]" $ do
        show (primeFactors 99 []) `shouldBe` "[11,3,3]"

    describe "primeFactors 91" $ do
      it "the prime factors of 91 are [13,7]" $ do
        show (primeFactors 91 []) `shouldBe` "[13,7]"

    describe "primeFactors 9779" $ do
      it "the prime factors of 9779 are [127,11,7]" $ do
        show (primeFactors 9779 []) `shouldBe` "[127,11,7]"

    describe "primeFactors 99000099" $ do
      it "the prime factors of 99000099 are [9901,101,11,3,3]" $ do
        show (primeFactors 99000099 []) `shouldBe` "[9901,101,11,3,3]"

    describe "primeFactors 9893443989" $ do
      it "the prime factors of 9893443989 are [3413,233,29,13,11,3]" $ do
        show (primeFactors 9893443989 []) `shouldBe` "[3413,233,29,13,11,3]" -- [[99957,98977]]

    describe "primeFactors 2147447412" $ do
          it "the prime factors of 2147447412 are [163,103,19,17,11,3,3,2,2]" $ do
            show (primeFactors 2147447412 []) `shouldBe` "[163,103,19,17,11,3,3,2,2]" -- [99756,21527]
