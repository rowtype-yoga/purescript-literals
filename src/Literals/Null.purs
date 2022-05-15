module Literals.Null
  ( Null
  , null
  )
where

import Prelude

foreign import data Null :: Type

foreign import _null :: Null

null :: Null
null = _null

instance showNull :: Show Null where
  show _ = "null"
