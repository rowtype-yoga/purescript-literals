module Test.Main where

import Prelude

import Effect (Effect)
import Literal (Literal, literal)
import Test.Assert (assertEqual)
import Unsafe.Coerce (unsafeCoerce)

main :: Effect Unit
main = do
  assertEqual
    { actual: unsafeCoerce (literal :: Literal "foo")
    , expected: "foo"
    }
