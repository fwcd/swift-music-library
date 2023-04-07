/// A facility for writing a library.
public protocol LibraryExporter {
    /// Writes the library.
    mutating func write(library: Library) throws
}
