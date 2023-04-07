import Foundation

public struct LibraryXMLImporter: LibraryImporter {
    public var data: Data

    public init(url: URL) throws {
        data = try Data(contentsOf: url)
    }

    public init(data: Data) {
        self.data = data
    }

    public func readLibrary() throws -> Library {
        let decoder = PropertyListDecoder()
        return try decoder.decode(Library.self, from: data)
    }
}
