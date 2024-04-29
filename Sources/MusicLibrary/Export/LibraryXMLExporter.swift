import Foundation
import OrderedPlistEncoder

/// An importer that writes an iTunes-compatible library XML file.
public struct LibraryXMLExporter: LibraryExporter {
    public var sink: (Data) throws -> Void
    public var outputFormatting: OrderedPlistEncoder.OutputFormatting = .prettyPrinted

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

    public func write(library: Library, onProgress: (ProgressInfo) -> Void) throws {
        var progress = ProgressInfo(total: 2) {
            didSet { onProgress(progress) }
        }

        let encoder = OrderedPlistEncoder(options: outputFormatting)

        progress.increment(message: "Encoding library to XML...")
        let encoded = try encoder.encode(library)

        progress.increment(message: "Writing library...")
        try sink(encoded)
    }
}
