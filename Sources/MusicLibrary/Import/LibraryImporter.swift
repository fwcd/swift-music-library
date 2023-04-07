public protocol LibraryImporter {
    func readLibrary() throws -> Library
}
