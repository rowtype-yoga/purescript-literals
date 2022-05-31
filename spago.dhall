{ name = "literals"
, license = "MIT"
, repository = "https://github.com/rowtype-yoga/purescript-literals.git"
, dependencies =
  [ "assert"
  , "effect"
  , "integers"
  , "maybe"
  , "numbers"
  , "partial"
  , "prelude"
  , "typelevel-prelude"
  , "unsafe-coerce"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
