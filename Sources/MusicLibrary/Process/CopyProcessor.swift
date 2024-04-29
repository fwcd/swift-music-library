import Foundation

public struct CopyProcessor: LibraryProcessor {
    private let mapping: (Track) -> URL

    public init(mapping: @escaping (Track) -> URL) {
        self.mapping = mapping
    }

    public mutating func process(library: inout Library, onProgress: (ProgressInfo) -> Void) throws {
        var progress = ProgressInfo(current: 0, total: library.tracks.count) {
            didSet {
                onProgress(progress)
            }
        }

        var newTracks: [Int: Track] = [:]
        for (i, (id, track)) in library.tracks.enumerated() {
            let oldURL = track.url
            let newURL = mapping(track)

            var newProgress = progress
            newProgress.current = i
            newProgress.message = "Copying to \(newURL)..."
            progress = newProgress

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
