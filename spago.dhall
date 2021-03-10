{ name = "literals"
, license = "MIT"
, repository = "https://github.com/jvliwanag/purescript-literals.git"
, dependencies =
  [ "assert"
  , "effect"
  , "console"
  , "integers"
  , "numbers"
  , "partial"
  , "psci-support"
  , "unsafe-coerce"
  , "typelevel-prelude"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
