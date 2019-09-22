{- Ergonomic utility for creating a semantic version for the most common case
   where you only care about the three version components
-}
let SemanticVersion =
        ./SemanticVersion.dhall sha256:fb7b5afe5221c5628b98d0539e2dca1de868c0dd0c40883bea0cee2f4448ce15
      ? ./SemanticVersion.dhall

let render =
        ./render.dhall sha256:57d455dd9164ab6bff230e51be028b09fcdacdbfb63f6a3c087e0563a294782c
      ? ./render.dhall

let version
    :   ∀(major : Natural)
      → ∀(minor : Natural)
      → ∀(patch : Natural)
      → SemanticVersion
    =   λ(major : Natural)
      → λ(minor : Natural)
      → λ(patch : Natural)
      → { major = major
        , minor = minor
        , patch = patch
        , build = [] : List Text
        , pre-release = [] : List Text
        }

let example = assert : render (version 2 3 5) ≡ "2.3.5"

in  version
