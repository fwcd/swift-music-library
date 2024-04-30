import Foundation

/// A library processor copying tracks to a location using a provided mapping.
public struct CopyProcessor: LibraryProcessor {
    private let mapping: (Track) -> URL

    public init(mapping: @escaping (Track) -> URL) {
        self.mapping = mapping
    }

    public func process(library: inout Library, onProgress: (ProgressInfo) -> Void) throws {
        var progress = ProgressInfo(total: library.tracks.count) {
            didSet { onProgress(progress) }
        }

        var newTracks: [Int: Track] = [:]
        for (id, track) in library.tracks {
            let oldURL = track.url
            let newURL = mapping(track)

            progress.increment(message: "Copying to \(newURL)...")

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
