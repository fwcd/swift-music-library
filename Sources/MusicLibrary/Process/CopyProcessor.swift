import Foundation

/// A library processor copying tracks to a location using a provided mapping.
public struct CopyProcessor: LibraryProcessor {
    private let skipCriteria: SkipCriteria = []
    private let mapping: (Track) -> URL?

    public struct SkipCriteria: OptionSet {
        public static let nameMatches = Self(rawValue: 1 << 0)
        public static let sizeMatches = Self(rawValue: 1 << 1)

        public let rawValue: UInt64

        public init(rawValue: UInt64) {
            self.rawValue = rawValue
        }
    }

    public init(mapping: @escaping (Track) -> URL?) {
        self.mapping = mapping
    }

    public func process(library: inout Library, onProgress: (ProgressInfo) -> Void) throws {
        var progress = ProgressInfo(total: library.tracks.count) {
            didSet { onProgress(progress) }
        }

        let fileManager = FileManager.default

        var newTracks: [Int: Track] = [:]
        for (i, (id, track)) in library.tracks.enumerated() {
            let oldURL = track.url
            let newURL = mapping(track)

            // TODO: Warn about skipping existing tracks
            if let newURL,
               let oldURL,
               !skipCriteria.contains(.nameMatches) || !fileManager.isReadableFile(atPath: newURL.path),
               try !skipCriteria.contains(.sizeMatches) || fileManager.fileSize(atPath: oldURL.path) != fileManager.fileSize(atPath: newURL.path) {
                progress.update(current: i, message: "Copying '\(oldURL.lastPathComponent)'...")
                try fileManager.createDirectory(at: newURL.deletingLastPathComponent(), withIntermediateDirectories: true)
                try fileManager.copyItem(at: oldURL, to: newURL)

                var newTrack = track
                newTrack.url = newURL
                newTracks[id] = newTrack
            }
        }

        library.tracks = newTracks
    }
}
