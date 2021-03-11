module Literals.Null where

import Prelude

foreign import data Null :: Type

foreign import null :: Null

instance showNull :: Show Null where
  show _ = "null"
