module P0022Spec where

import P0022 (totalScoreFromString)
import Test.Hspec (Spec, describe, context, it, shouldBe)
import System.IO


-- |Required for auto-discpvery
spec :: Spec
spec =
  describe "Project Euler Problem 21 Solution" $ do

    let str = "\"MARY\",\"PATRICIA\",\"LINDA\",\"BARBARA\",\"ELIZABETH\",\"JENNIFER\",\"MARIA\",\"SUSAN\",\"MARGARET\",\"DOROTHY\",\"LISA\",\"NANCY\", \
    \ \"KAREN\",\"BETTY\", \"HELEN\",\"SANDRA\",\"DONNA\",\"CAROL\",\"RUTH\",\"SHARON\",\"MICHELLE\",\"LAURA\""

    describe "What is the total of all the name scores in the above string?" $ do
      it "The the total of all the name scores in the above is: 16003" $ do
        show (totalScoreFromString str) `shouldBe` show(16003)