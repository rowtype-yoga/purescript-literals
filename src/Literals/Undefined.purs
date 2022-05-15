module Literals.Undefined
  ( Undefined
  , undefined
  )
where

import Prelude

foreign import data Undefined :: Type

foreign import _undefined :: Undefined

undefined :: Undefined
undefined = _undefined

instance undefinedEq :: Eq Undefined where
  eq _ _ = true
instance undefinedShow :: Show Undefined where
  show _ = "Undefined"
