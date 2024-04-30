import Foundation

/// An importer that reads an iTunes-compatible library XML file.
public struct LibraryXMLImporter: LibraryImporter {
    public var data: Data

    public init(filePath: String) throws {
        try self.init(url: URL(fileURLWithPath: filePath))
    }

    public init(url: URL) throws {
        self.init(data: try Data(contentsOf: url))
    }

    public init(data: Data) {
        self.data = data
    }

    public func readLibrary(onProgress: (ProgressInfo) -> Void) throws -> Library {
        var progress = ProgressInfo(total: 1) {
            didSet { onProgress(progress) }
        }

        progress.increment(message: "Decoding library from XML...")
        let decoder = PropertyListDecoder()
        return try decoder.decode(Library.self, from: data)
    }
}
