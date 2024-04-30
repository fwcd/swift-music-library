import Foundation

/// A library processor copying tracks to a location using a provided mapping.
public struct CopyProcessor: LibraryProcessor {
    private let mapping: (Track) -> URL?

    public init(mapping: @escaping (Track) -> URL?) {
        self.mapping = mapping
    }

    public func process(library: inout Library, onProgress: (ProgressInfo) -> Void) throws {
        var progress = ProgressInfo(total: library.tracks.count) {
            didSet { onProgress(progress) }
        }

        var newTracks: [Int: Track] = [:]
        for (i, (id, track)) in library.tracks.enumerated() {
            let oldURL = track.url
            let newURL = mapping(track)

            // TODO: Warn about skipping existing tracks
            if let newURL, let oldURL, !FileManager.default.isReadableFile(atPath: newURL.path) {
                progress.update(current: i, message: "Copying '\(oldURL.lastPathComponent)'...")
                try FileManager.default.createDirectory(at: newURL.deletingLastPathComponent(), withIntermediateDirectories: true)
                try FileManager.default.copyItem(at: oldURL, to: newURL)

                var newTrack = track
                newTrack.url = newURL
                newTracks[id] = newTrack
            }
        }

        library.tracks = newTracks
    }
}
