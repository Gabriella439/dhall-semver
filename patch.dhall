-- Increment the patch version
let SemVer =
      ./SemVer.dhall sha256:fb7b5afe5221c5628b98d0539e2dca1de868c0dd0c40883bea0cee2f4448ce15

let patch : SemVer → SemVer = λ(v : SemVer) → v ⫽ { patch = v.patch + 1 }

let example =
        assert
      :   patch
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
              0
          , patch =
              1
          , pre-release =
              [] : List Text
          , build =
              [] : List Text
          }

let example =
        assert
      :   patch
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
              3
          , patch =
              6
          , pre-release =
              [] : List Text
          , build =
              [] : List Text
          }

in  patch
