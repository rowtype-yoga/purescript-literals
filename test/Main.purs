module Test.Main where

import Prelude

import Effect (Effect)
import Literals.Number (Literal, literal) as Number
import Literals.String (Literal, literal) as String
import Test.Assert (assertEqual)
import Unsafe.Coerce (unsafeCoerce)


main :: Effect Unit
main = do
  assertEqual
    { actual: unsafeCoerce (String.literal :: String.Literal "foo")
    , expected: "foo"
    }
  assertEqual
    { actual: unsafeCoerce (Number.literal :: Number.Literal "8")
    , expected: 8.0
    }
  assertEqual
    { actual: unsafeCoerce (Number.literal :: Number.Literal "-8")
    , expected: -8.0
    }
  assertEqual
    { actual: unsafeCoerce (Number.literal :: Number.Literal "100.0")
    , expected: 100.0
    }
  assertEqual
    { actual: unsafeCoerce (Number.literal :: Number.Literal "-100.0")
    , expected: -100.0
    }
  assertEqual
    { actual: unsafeCoerce (Number.literal :: Number.Literal "0.0")
    , expected: 0.0
    }


