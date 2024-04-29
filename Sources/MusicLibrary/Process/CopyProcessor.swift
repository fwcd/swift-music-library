import Foundation

public struct CopyProcessor: LibraryProcessor {
    private let mapping: (Track) -> URL

    public init(mapping: @escaping (Track) -> URL) {
        self.mapping = mapping
    }

    public mutating func process(library: inout Library) throws {
        var newTracks: [Int: Track] = [:]
        for (id, track) in library.tracks {
            let oldURL = track.url
            let newURL = mapping(track)

            if let oldURL {
                try FileManager.default.copyItem(at: oldURL, to: newURL)
            }

            var newTrack = track
            newTrack.url = newURL
            newTracks[id] = newTrack
        }
        library.tracks = newTracks
    }
}
