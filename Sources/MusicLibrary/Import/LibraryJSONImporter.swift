import Foundation

/// An importer that reads a library JSON file.
public struct LibraryJSONImporter: LibraryImporter {
    public var data: Data

    public init(url: URL) throws {
        data = try Data(contentsOf: url)
    }

    public init(data: Data) {
        self.data = data
    }

    public func readLibrary() throws -> Library {
        let decoder = JSONDecoder()
        return try decoder.decode(Library.self, from: data)
    }
}
