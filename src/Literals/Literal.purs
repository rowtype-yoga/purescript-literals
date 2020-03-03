module Literals.Literal where

import Prelude

import Unsafe.Coerce (unsafeCoerce)

foreign import data Literal :: Type -> Symbol -> Type

instance literalEq :: Eq (Literal typ sym) where
  eq _ _ = true
instance literalShow :: Show typ => Show (Literal typ sym) where
  show a = "(Literal " <> (show $ toValue a) <> ")"

toValue :: ∀ s a. Literal a s -> a
toValue = unsafeCoerce
