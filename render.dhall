-- Render a semantic version as `Text`

let Prelude =
        ./Prelude.dhall sha256:10db3c919c25e9046833df897a8ffe2701dc390fa0893d958c3430524be5a43e
      ? ./Prelude.dhall

let SemanticVersion =
        ./SemanticVersion.dhall sha256:fb7b5afe5221c5628b98d0539e2dca1de868c0dd0c40883bea0cee2f4448ce15
      ? ./SemanticVersion.dhall

let renderSuffix
    : Text → List Text → Text
    = λ(prefix : Text) →
      λ(ts : List Text) →
        if    Prelude.List.null Text ts
        then  ""
        else  "${prefix}${Prelude.Text.concatSep "." ts}"

let render
    : SemanticVersion → Text
    = λ(v : SemanticVersion) →
        let X = Natural/show v.major

        let Y = Natural/show v.minor

        let Z = Natural/show v.patch

        let pre-release = renderSuffix "-" v.pre-release

        let build = renderSuffix "+" v.build

        in  "${X}.${Y}.${Z}${pre-release}${build}"

let example =
        assert
      :   render
            { major = 1
            , minor = 0
            , patch = 0
            , pre-release = [] : List Text
            , build = [] : List Text
            }
        ≡ "1.0.0"

let example =
        assert
      :   render
            { major = 1
            , minor = 0
            , patch = 0
            , pre-release = [ "alpha" ]
            , build = [] : List Text
            }
        ≡ "1.0.0-alpha"

let example =
        assert
      :   render
            { major = 1
            , minor = 0
            , patch = 0
            , pre-release = [ "alpha", "1" ]
            , build = [] : List Text
            }
        ≡ "1.0.0-alpha.1"

let example =
        assert
      :   render
            { major = 1
            , minor = 0
            , patch = 0
            , pre-release = [ "0", "3", "7" ]
            , build = [] : List Text
            }
        ≡ "1.0.0-0.3.7"

let example =
        assert
      :   render
            { major = 1
            , minor = 0
            , patch = 0
            , pre-release = [ "x", "7", "z", "92" ]
            , build = [] : List Text
            }
        ≡ "1.0.0-x.7.z.92"

let example =
        assert
      :   render
            { major = 1
            , minor = 0
            , patch = 0
            , pre-release = [ "alpha" ]
            , build = [ "001" ]
            }
        ≡ "1.0.0-alpha+001"

let example =
        assert
      :   render
            { major = 1
            , minor = 0
            , patch = 0
            , pre-release = [] : List Text
            , build = [ "20130313144700" ]
            }
        ≡ "1.0.0+20130313144700"

let example =
        assert
      :   render
            { major = 1
            , minor = 0
            , patch = 0
            , pre-release = [ "beta" ]
            , build = [ "exp", "sha", "5114f85" ]
            }
        ≡ "1.0.0-beta+exp.sha.5114f85"

in  render
