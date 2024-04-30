import Foundation

/// An importer that reads a library JSON file.
public struct LibraryJSONImporter: LibraryImporter {
    public var data: Data

    public init(filePath: String) throws {
        try self.init(url: URL(fileURLWithPath: filePath))
    }

    public init(url: URL) throws {
        data = try Data(contentsOf: url)
    }

    public init(data: Data) {
        self.data = data
    }

    public func readLibrary(onProgress: (ProgressInfo) -> Void) throws -> Library {
        var progress = ProgressInfo(total: 1) {
            didSet { onProgress(progress) }
        }

        progress.increment(message: "Decoding library from JSON...")
        let decoder = JSONDecoder()
        return try decoder.decode(Library.self, from: data)
    }
}
