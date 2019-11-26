module Literals.Literal where

import Unsafe.Coerce (unsafeCoerce)

foreign import data Literal :: Type -> Symbol -> Type

toValue :: ∀ s a. Literal a s -> a
toValue = unsafeCoerce
