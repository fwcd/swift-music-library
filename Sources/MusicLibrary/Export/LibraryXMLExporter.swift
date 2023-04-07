import Foundation

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

    public func write(library: Library) throws {
        let encoder = PropertyListEncoder()
        encoder.outputFormat = .xml
        try sink(encoder.encode(library))
    }
}
