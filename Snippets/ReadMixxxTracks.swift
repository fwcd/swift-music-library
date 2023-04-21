import Foundation
import MusicLibrary

let importer = try MixxxImporter()
let library = try importer.readLibrary()
dump(library.tracks)
