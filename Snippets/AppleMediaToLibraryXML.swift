import Foundation

#if os(macOS)

import MusicLibrary

let args = CommandLine.arguments
if args.count <= 1 {
    print("Usage: \(args[0]) <path to output library xml>")
    exit(1)
}

let importer = try LocalAppleMediaImporter()
let exporter = LibraryXMLExporter(filePath: args[1])

var library = try importer.readLibrary()
library.playlists.removeAll { $0.distinguishedKind != nil }
try exporter.write(library: library)

#else

fatalError("Converting the Apple media library is only supported on macOS")

#endif
