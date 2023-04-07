/// A facility for reading a library.
public protocol LibraryImporter {
    /// Reads the library.
    func readLibrary() throws -> Library
}
