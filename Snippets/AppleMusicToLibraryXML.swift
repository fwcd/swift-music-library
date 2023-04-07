import Foundation
import MusicLibrary

let args = CommandLine.arguments
if args.count <= 1 {
    print("Usage: \(args[0]) <path to output library xml>")
    exit(1)
}

let importer = try LocalAppleMusicImporter()
let exporter = LibraryXMLExporter(filePath: args[1])

let library = try importer.readLibrary()
try exporter.write(library: library)
