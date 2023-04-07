import Foundation

#if os(macOS)

import MusicLibrary

let importer = try LocalAppleMusicImporter()
let library = try importer.readLibrary()
dump(library)

#else

fatalError("Reading the Apple Music library is only supported on macOS")

#endif
