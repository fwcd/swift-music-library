/// A facility for writing a library.
public protocol LibraryExporter {
    /// Writes the library.
    func write(library: Library, onProgress: (ProgressInfo) -> Void) throws
}

public extension LibraryExporter {
    func write(library: Library) throws {
        try write(library: library, onProgress: { _ in })
    }
}
