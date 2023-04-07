import Foundation

public struct LibraryXMLImporter: LibraryImporter {
    public var data: Data

    public init(filePath: String) throws {
        if #available(macOS 13.0, *) {
            try self.init(url: URL(filePath: filePath))
        } else {
            try self.init(url: URL(fileURLWithPath: filePath))
        }
    }

    public init(url: URL) throws {
        self.init(data: try Data(contentsOf: url))
    }

    public init(data: Data) {
        self.data = data
    }

    public func readLibrary() throws -> Library {
        let decoder = PropertyListDecoder()
        return try decoder.decode(Library.self, from: data)
    }
}
