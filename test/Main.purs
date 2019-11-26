module Test.Main where

import Prelude

import Effect (Effect)
import Literals (NumberLit, StringLit, IntLit, intLit, numberLit, stringLit)
import Test.Assert (assertEqual)
import Unsafe.Coerce (unsafeCoerce)


main :: Effect Unit
main = do
  assertEqual
    { actual: unsafeCoerce (stringLit :: StringLit "foo")
    , expected: "foo"
    }
  assertEqual
    { actual: unsafeCoerce (numberLit :: NumberLit "8.0")
    , expected: 8.0
    }
  assertEqual { actual: unsafeCoerce (numberLit :: NumberLit "-8.0")
    , expected: -8.0
    }
  assertEqual
    { actual: unsafeCoerce (intLit :: IntLit "8")
    , expected: 8
    }
  assertEqual { actual: unsafeCoerce (intLit :: IntLit "-8")
    , expected: -8
    }

