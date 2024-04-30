/// A processing stage that transforms a library.
public protocol LibraryProcessor {
    /// Processes the library, potentially with side-effects.
    ///
    /// May provide progress info via the `onProgress` callback.
    func process(library: inout Library, onProgress: (ProgressInfo) -> Void) throws
}

public extension LibraryProcessor {
    /// Processes the library, potentially with side-effects.
    func process(library: inout Library) throws {
        try process(library: &library, onProgress: { _ in })
    }
}

