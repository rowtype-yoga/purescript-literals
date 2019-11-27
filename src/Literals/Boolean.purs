module Literals.Boolean
       ( BooleanLit
       , false_
       , true_
       ) where

import Literals.Literal (Literal)
import Unsafe.Coerce (unsafeCoerce)

type BooleanLit sym = Literal Boolean sym

true_ :: BooleanLit "true"
true_ = unsafeCoerce true

false_ :: BooleanLit "false"
false_ = unsafeCoerce false

