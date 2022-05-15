module Literals.Number
       ( FractionalPart
       , IntegerPart
       , NumberLit
       , Sign
       , class Number
       , class Number'
       , NumberPart
       , numberLit
       ) where

import Prelude

import Data.Maybe (fromJust)
import Data.Number (fromString)
import Data.Symbol (class IsSymbol)
import Literals.Int (class Digit)
import Literals.Literal (Literal)
import Partial.Unsafe (unsafePartial)
import Prim.Symbol (class Cons)
import Type.Prelude (reflectSymbol, Proxy(..))
import Unsafe.Coerce (unsafeCoerce)

class Number (sym :: Symbol)

instance numberInstance :: (Number' h t Sign, Cons h t s) => Number s

data NumberPart
foreign import data Sign :: NumberPart
foreign import data IntegerPart :: NumberPart
foreign import data FractionalPart :: NumberPart

class Number' (head :: Symbol) (tail :: Symbol) (part :: NumberPart)

instance signPart :: (Cons h' t' t, Number' h' t' IntegerPart) => Number' "-" t Sign
else instance signPartEmpty :: (Number' h t IntegerPart) => Number' h t Sign
else instance pointIntegerPart :: (Cons h' t' t, Number' h' t' FractionalPart) => Number' "." t IntegerPart
else instance lastFractionalPart :: (Digit h) => Number' h "" FractionalPart
else instance digitIntegerPart :: (Digit h, Cons h' t' t, Number' h' t' IntegerPart) => Number' h t IntegerPart
else instance digitFractionalPart :: (Digit h, Cons h' t' t, Number' h' t' FractionalPart) => Number' h t FractionalPart

type NumberLit sym = Literal Number sym

numberLit :: forall sym. IsSymbol sym => Number sym => NumberLit sym
numberLit = unsafeCoerce $ unsafePartial $ fromJust $ fromString $ reflectSymbol (Proxy :: Proxy sym)
