# purescript-literal

A Symbol Proxy having a runtime value equal to the reflected symbol.

# Example

```purescript
import Literal

center :: Literal "center"
center = literal -- the runtime value of center is the string "center"
```
