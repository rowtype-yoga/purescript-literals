{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name =
    "literal"
, dependencies =
    [ "assert"
    , "effect"
    , "console"
    , "psci-support"
    , "unsafe-coerce"
    ]
, packages =
    ./packages.dhall
, sources =
    [ "src/**/*.purs", "test/**/*.purs" ]
}
