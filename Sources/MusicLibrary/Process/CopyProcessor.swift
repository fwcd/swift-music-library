import Foundation

/// A library processor copying tracks to a location using a provided mapping.
public struct CopyProcessor: LibraryProcessor {
    private let skipPredicate: SkipPredicate
    private let mapping: (Track) -> URL?

    /// An expression that describes whether a given copy operation (old URL to
    /// new URL) should be skipped and, if so, provides a reason.
    public enum SkipPredicate {
        case never
        case always
        case lambda((URL, URL) -> String?)
        case and([SkipPredicate])
        case or([SkipPredicate])

        public static let fileExists: Self = .lambda { _, newURL in
            FileManager.default.fileExists(atPath: newURL.path) ? "file exists" : nil
        }
        public static let sizeMatches: Self = .lambda { oldURL, newURL in
            (try? FileManager.default.fileSize(atPath: oldURL.path) == FileManager.default.fileSize(atPath: newURL.path)).flatMap { $0 ? "size matches" : nil }
        }

        /// Evaluates the predicate, providing a reason if the copy should be skipped.
        public func skipReason(oldURL: URL, newURL: URL) -> String? {
            switch self {
            case .never:
                return nil
            case .always:
                return "always"
            case .lambda(let lambda):
                return lambda(oldURL, newURL)
            case .and(let terms):
                return terms
                    .map { $0.skipReason(oldURL: oldURL, newURL: newURL) }
                    .reduce1 { acc, next in acc.flatMap { acc in next.map { next in "\(acc) and \(next)" } } } ?? "empty and"
            case .or(let terms):
                return terms
                    .compactMap { $0.skipReason(oldURL: oldURL, newURL: newURL) }
                    .first
            }
        }
    }

    public init(skipPredicate: SkipPredicate = .never, mapping: @escaping (Track) -> URL?) {
        self.skipPredicate = skipPredicate
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

            if let newURL, let oldURL {
                if let reason = skipPredicate.skipReason(oldURL: oldURL, newURL: newURL) {
                    progress.update(current: i, message: "Skipping '\(oldURL.lastPathComponent)' (\(reason))...")
                } else {
                    progress.update(current: i, message: "Copying '\(oldURL.lastPathComponent)'...")

                    let fileManager = FileManager.default

                    if fileManager.fileExists(atPath: newURL.path) {
                        try fileManager.removeItem(at: newURL)
                    }

                    try fileManager.createDirectory(at: newURL.deletingLastPathComponent(), withIntermediateDirectories: true)
                    try fileManager.copyItem(at: oldURL, to: newURL)
                }

                var newTrack = track
                newTrack.url = newURL
                newTracks[id] = newTrack
            }
        }

        library.tracks = newTracks
    }
}
