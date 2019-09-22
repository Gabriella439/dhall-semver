let SemanticVersion
    : Type
    = { major : Natural
      , minor : Natural
      , patch : Natural
      , pre-release : List Text
      , build : List Text
      }

in  SemanticVersion
