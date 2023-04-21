import Foundation

#if os(macOS)

import MusicLibrary

let importer = try LocalAppleMediaImporter()
let library = try importer.readLibrary()
dump(library)

#else

fatalError("Reading the Apple media library is only supported on macOS")

#endif
