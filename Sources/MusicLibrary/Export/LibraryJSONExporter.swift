import Foundation

/// An importer that writes a library JSON file.
public struct LibraryJSONExporter: LibraryExporter {
    public var sink: (Data) throws -> Void

    public init(sink: @escaping (Data) throws -> Void) {
        self.sink = sink
    }

    public init(url: URL) {
        self.init { data in
            try data.write(to: url)
        }
    }

    public init(filePath: String) {
        self.init(url: URL(fileURLWithPath: filePath))
    }

    public func write(library: Library) throws {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        try sink(encoder.encode(library))
    }
}
