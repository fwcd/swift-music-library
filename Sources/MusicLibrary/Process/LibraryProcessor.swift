/// A processing stage that transforms a library
public protocol LibraryProcessor {
    /// Processes the library.
    func process(library: inout Library, onProgress: (ProgressInfo) -> Void) throws
}

public extension LibraryProcessor {
    func process(library: inout Library) throws {
        try process(library: &library, onProgress: { _ in })
    }
}

