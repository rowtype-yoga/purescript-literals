module Literals.String
       ( Literal
       , literal
       , toString
       ) where

import Data.Symbol (class IsSymbol, SProxy(..), reflectSymbol)
import Unsafe.Coerce (unsafeCoerce)

foreign import data Literal :: Symbol -> Type

literal :: forall sym. IsSymbol sym => Literal sym
literal = unsafeCoerce (reflectSymbol (SProxy :: SProxy sym))

toString :: forall sym. Literal sym -> String
toString = unsafeCoerce

