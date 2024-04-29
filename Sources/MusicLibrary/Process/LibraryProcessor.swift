/// A processing stage that transforms a library
public protocol LibraryProcessor {
    /// Processes the library.
    mutating func process(library: inout Library) throws
}

