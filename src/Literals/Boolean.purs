module Literals.Boolean where

import Unsafe.Coerce (unsafeCoerce)

data True
data False

true_ :: True
true_ = unsafeCoerce true

false_ :: False
false_ = unsafeCoerce false

