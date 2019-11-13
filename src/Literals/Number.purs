module Literals.Number where

import Data.Maybe (fromJust)
import Data.Number (fromString)
import Data.Symbol (class IsSymbol, SProxy(..))
import Partial.Unsafe (unsafePartial)
import Prim.Symbol (class Cons)
import Type.Prelude (reflectSymbol)
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

class Number (sym :: Symbol)

instance numberInstance :: (Number' h t Sign, Cons h t s) => Number s

foreign import kind NumberPart
foreign import data Sign :: NumberPart
foreign import data IntegerPart :: NumberPart
foreign import data FractionalPart :: NumberPart

class Number' (head :: Symbol) (tail :: Symbol) (part :: NumberPart)

instance signPart :: (Cons h' t' t, Number' h' t' IntegerPart) => Number' "-" t Sign
else instance signPartEmpty :: (Number' h t IntegerPart) => Number' h t Sign
else instance pointIntegerPart :: (Cons h' t' t, Number' h' t' FractionalPart) => Number' "." t IntegerPart
else instance lastIntegerPart ::  (Digit h) => Number' h "" IntegerPart
else instance digitIntegerPart :: (Digit h, Cons h' t' t, Number' h' t' IntegerPart) => Number' h t IntegerPart
else instance lastFractionalPart :: (Digit h) => Number' h "" FractionalPart
else instance digitFractionalPart :: (Digit h, Cons h' t' t, Number' h' t' FractionalPart) => Number' h t FractionalPart

foreign import data Literal :: Symbol -> Type

literal :: forall s. IsSymbol s => Number s => Literal s
literal = (unsafeCoerce (unsafePartial (fromJust (fromString (reflectSymbol (SProxy :: SProxy s))))))

toNumber :: forall s. Literal s -> Number
toNumber = unsafeCoerce

