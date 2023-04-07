#if canImport(iTunesLibrary)

/// An importer for the local Apple Music library using
/// the iTunes Library framework. Only for macOS.
public struct LocalAppleMusicITImporter: LibraryImporter {
    public func readLibrary() throws -> Library {
        throw LibraryImportError.notImplemented
    }
}

#endif
