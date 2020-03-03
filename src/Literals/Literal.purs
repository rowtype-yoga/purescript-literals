module Literals.Literal where

import Prelude

import Unsafe.Coerce (unsafeCoerce)

foreign import data Literal :: Type -> Symbol -> Type

instance literalEq :: Eq (Literal typ sym) where
  eq _ _ = true

toValue :: ∀ s a. Literal a s -> a
toValue = unsafeCoerce
