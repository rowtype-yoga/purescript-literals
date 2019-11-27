module Literals.String
       ( stringLit
       , StringLit
       ) where

import Data.Symbol (class IsSymbol, SProxy(..), reflectSymbol)
import Literals.Literal (Literal)
import Unsafe.Coerce (unsafeCoerce)

type StringLit sym = Literal String sym

stringLit :: forall sym. IsSymbol sym => StringLit sym
stringLit = unsafeCoerce (reflectSymbol (SProxy :: SProxy sym))


