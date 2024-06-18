import Foundation

/// A library processor copying tracks to a location using a provided mapping.
public struct CopyProcessor: LibraryProcessor {
    private let skipPredicate: SkipPredicate = .never
    private let mapping: (Track) -> URL?

    /// An expression that describes whether a given copy operation (old URL to new URL) should be skipped.
    public enum SkipPredicate {
        case never
        case always
        case lambda((URL, URL) -> Bool)
        case and([SkipPredicate])
        case or([SkipPredicate])

        public static let fileExists: Self = .lambda { _, newURL in
            FileManager.default.fileExists(atPath: newURL.path)
        }
        public static let sizeMatches: Self = .lambda { oldURL, newURL in
            (try? FileManager.default.fileSize(atPath: oldURL.path) == FileManager.default.fileSize(atPath: newURL.path)) ?? false
        }

        /// Evaluates the predicate.
        public func shouldSkip(oldURL: URL, newURL: URL) -> Bool {
            switch self {
            case .never: return false
            case .always: return true
            case .lambda(let lambda): return lambda(oldURL, newURL)
            case .and(let terms): return terms.allSatisfy { $0.shouldSkip(oldURL: oldURL, newURL: newURL) }
            case .or(let terms): return terms.contains { $0.shouldSkip(oldURL: oldURL, newURL: newURL) }
            }
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
            if let newURL, let oldURL {
                if skipPredicate.shouldSkip(oldURL: oldURL, newURL: newURL) {
                    progress.update(current: i, message: "Skipping '\(oldURL.lastPathComponent)'...")
                } else {
                    progress.update(current: i, message: "Copying '\(oldURL.lastPathComponent)'...")
                    try fileManager.createDirectory(at: newURL.deletingLastPathComponent(), withIntermediateDirectories: true)
                    try fileManager.copyItem(at: oldURL, to: newURL)

                    var newTrack = track
                    newTrack.url = newURL
                    newTracks[id] = newTrack
                }
            }
        }

        library.tracks = newTracks
    }
}
