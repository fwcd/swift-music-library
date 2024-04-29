import Foundation

/// An importer that writes a library JSON file.
public struct LibraryJSONExporter: LibraryExporter {
    public var sink: (Data) throws -> Void
    public var outputFormatting: JSONEncoder.OutputFormatting = .prettyPrinted
    public var keyEncodingStrategy: JSONEncoder.KeyEncodingStrategy = .useDefaultKeys

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
        encoder.outputFormatting = outputFormatting
        encoder.keyEncodingStrategy = keyEncodingStrategy
        try sink(encoder.encode(library))
    }
}
