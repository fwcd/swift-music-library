import Foundation
import MusicLibrary

let args = CommandLine.arguments
if args.count <= 1 {
    print("Usage: \(args[0]) <path to library xml>")
    exit(1)
}

let importer = try LibraryXMLImporter(filePath: args[1])
let library = try importer.readLibrary()
dump(library)
