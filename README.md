# Swift Music Library

[![Build](https://github.com/fwcd/swift-music-library/actions/workflows/build.yml/badge.svg)](https://github.com/fwcd/swift-music-library/actions/workflows/build.yml)
[![Docs](https://github.com/fwcd/swift-music-library/actions/workflows/docs.yml/badge.svg)](https://fwcd.github.io/swift-music-library/documentation/musiclibrary)

A small library for programmatically interfacing with local music libraries, including

- The local iTunes/Apple Music library
- iTunes-compatible XML files
- The Mixxx library (WIP)

## Example

To export the local Apple Music library to an iTunes-compatible XML, use the following snippet:

```swift
import MusicLibrary

let importer = try LocalAppleMusicImporter()
let exporter = LibraryXMLExporter(filePath: "path/to/output.xml")

let library = try importer.readLibrary()
try exporter.write(library: library)
```

The full example can be found [here](Snippets/AppleMusicToLibraryXML.swift).
