module Literals.Undefined where

import Prelude

foreign import data Undefined :: Type

foreign import undefined :: Undefined

instance undefinedEq :: Eq Undefined where
  eq _ _ = true
