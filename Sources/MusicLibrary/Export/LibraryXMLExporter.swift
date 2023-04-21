import Foundation
import OrderedPlistEncoder

/// An importer that writes an iTunes-compatible library XML file.
public struct LibraryXMLExporter: LibraryExporter {
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
        let encoder = OrderedPlistEncoder(options: .prettyPrinted)
        try sink(encoder.encode(library))
    }
}
