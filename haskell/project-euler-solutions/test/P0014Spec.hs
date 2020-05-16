module P0014Spec where

import P0014 (numProducingLongestCollatzSeqUnderOneMilion)
import Test.Hspec (Spec, describe, context, it, shouldBe)

-- |Required for auto-discpvery
spec :: Spec
spec =
  describe "Project Euler Problem 14 Solution" $ do

    describe "numProducingLongestCollatzSeqUnderOneMilion" $ do
      it "The longest Collatz sequence under 1 milion is produced by: 837799 which has 525 elements" $ do
         show numProducingLongestCollatzSeqUnderOneMilion `shouldBe` "(525,837799)"