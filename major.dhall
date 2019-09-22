-- Increment the major version
let SemanticVersion =
        ./SemanticVersion.dhall sha256:fb7b5afe5221c5628b98d0539e2dca1de868c0dd0c40883bea0cee2f4448ce15
      ? ./SemanticVersion.dhall

let major
    : SemanticVersion → SemanticVersion
    = λ(v : SemanticVersion) → v ⫽ { major = v.major + 1, minor = 0, patch = 0 }

let example =
        assert
      :   major
            { major = 1
            , minor = 0
            , patch = 0
            , pre-release = [] : List Text
            , build = [] : List Text
            }
        ≡ { major = 2
          , minor = 0
          , patch = 0
          , pre-release = [] : List Text
          , build = [] : List Text
          }

let example =
        assert
      :   major
            { major = 2
            , minor = 3
            , patch = 5
            , pre-release = [] : List Text
            , build = [] : List Text
            }
        ≡ { major = 3
          , minor = 0
          , patch = 0
          , pre-release = [] : List Text
          , build = [] : List Text
          }

in  major
