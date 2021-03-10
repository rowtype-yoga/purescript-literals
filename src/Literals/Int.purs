module Literals.Int
        ( IntLit
        , IntegerPart
        , Sign
        , class Digit
        , class Int
        , class Int'
        , intLit
        , IntPart
        ) where

import Prelude

import Data.Int (fromString)
import Data.Maybe (fromJust)
import Data.Symbol (class IsSymbol)
import Literals.Literal (Literal)
import Partial.Unsafe (unsafePartial)
import Prim.Symbol (class Cons)
import Type.Prelude (SProxy(..), reflectSymbol)
import Unsafe.Coerce (unsafeCoerce)

class Digit (s :: Symbol)

instance digit0 :: Digit "0"
else instance digit1 :: Digit "1"
else instance digit2 :: Digit "2"
else instance digit3 :: Digit "3"
else instance digit4 :: Digit "4"
else instance digit5 :: Digit "5"
else instance digit6 :: Digit "6"
else instance digit7 :: Digit "7"
else instance digit8 :: Digit "8"
else instance digit9 :: Digit "9"

data IntPart
foreign import data Sign :: IntPart
foreign import data IntegerPart :: IntPart

class Int (sym :: Symbol)
instance intInstance :: (Int' h t Sign, Cons h t s) => Int s

class Int' (head :: Symbol) (tail :: Symbol) (part :: IntPart)

instance signPart :: (Cons h' t' t, Int' h' t' IntegerPart) => Int' "-" t Sign
else instance signPartEmpty :: (Int' h t IntegerPart) => Int' h t Sign
else instance lastIntegerPart :: (Digit h) => Int' h "" IntegerPart
else instance digitIntegerPart :: (Digit h, Cons h' t' t, Int' h' t' IntegerPart) => Int' h t IntegerPart

type IntLit sym = Literal Int sym

intLit :: forall sym. IsSymbol sym => Int sym => IntLit sym
intLit = unsafeCoerce $ unsafePartial $ fromJust $ fromString $ reflectSymbol (SProxy :: SProxy sym)
