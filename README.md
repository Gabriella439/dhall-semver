# `dhall-semver`

This package provides [Dhall](http://dhall-lang.org/) support for
[semantic versioning](https://semver.org/), in the form of:

* A [`SemanticVersion`](./SemanticVersion.dhall) type
* A [`render`](./render.dhall) function to render a `SemanticVersion` as `Text`
* Utilities to bump the different components of the version number
