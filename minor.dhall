-- Increment the minor version
let SemVer = ./SemVer.dhall

let minor
    : SemVer → SemVer =
    λ(v : SemVer) → v ⫽ { minor = v.minor + 1, patch = 0 }

let example =
        assert
      :   minor
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
              1
          , minor =
              1
          , patch =
              0
          , pre-release =
              [] : List Text
          , build =
              [] : List Text
          }

let example =
        assert
      :   minor
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
              2
          , minor =
              4
          , patch =
              0
          , pre-release =
              [] : List Text
          , build =
              [] : List Text
          }

in  minor
