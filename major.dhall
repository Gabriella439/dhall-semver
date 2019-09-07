-- Increment the major version
let SemVer = ./SemVer.dhall

let major
    : SemVer → SemVer =
    λ(v : SemVer) → v ⫽ { major = v.major + 1, minor = 0, patch = 0 }

let example =
        assert
      :   major
            { major =
                1
            , minor =
                0
            , patch =
                0
            , pre-release =
                [] : List Text
            , build =
                [] : List Text
            }
        ≡ { major =
              2
          , minor =
              0
          , patch =
              0
          , pre-release =
              [] : List Text
          , build =
              [] : List Text
          }

let example =
        assert
      :   major
            { major =
                2
            , minor =
                3
            , patch =
                5
            , pre-release =
                [] : List Text
            , build =
                [] : List Text
            }
        ≡ { major =
              3
          , minor =
              0
          , patch =
              0
          , pre-release =
              [] : List Text
          , build =
              [] : List Text
          }

in  major
