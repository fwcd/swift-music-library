import MusicLibrary

let importer = try LocalAppleMusicImporter()
let library = try importer.readLibrary()
dump(library)
