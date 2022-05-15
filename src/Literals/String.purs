module Literals.String
       ( stringLit
       , StringLit
       ) where

import Data.Symbol (class IsSymbol, reflectSymbol)
import Type.Proxy (Proxy(..))
import Literals.Literal (Literal)
import Unsafe.Coerce (unsafeCoerce)

type StringLit sym = Literal String sym

stringLit :: forall sym. IsSymbol sym => StringLit sym
stringLit = unsafeCoerce (reflectSymbol (Proxy :: Proxy sym))
