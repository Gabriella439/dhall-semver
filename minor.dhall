-- Increment the minor version
let SemanticVersion =
      ./SemanticVersion.dhall sha256:fb7b5afe5221c5628b98d0539e2dca1de868c0dd0c40883bea0cee2f4448ce15

let minor
    : SemanticVersion → SemanticVersion =
    λ(v : SemanticVersion) → v ⫽ { minor = v.minor + 1, patch = 0 }

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
