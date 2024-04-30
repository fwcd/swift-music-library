/// A facility for reading a library.
public protocol LibraryImporter {
    /// Reads the library.
    func readLibrary(onProgress: (ProgressInfo) -> Void) throws -> Library
}

public extension LibraryImporter {
    func readLibrary() throws -> Library {
        try readLibrary(onProgress: { _ in })
    }
}
