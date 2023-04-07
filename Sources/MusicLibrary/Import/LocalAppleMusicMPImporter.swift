#if canImport(MediaPlayer)

import MediaPlayer

/// An importer for the local Apple Music library using
/// the Media Player framework. Primarily intended for iOS.
public struct LocalAppleMusicMPImporter: LibraryImporter {
    public func readLibrary() throws -> Library {
        throw LibraryImportError.notImplemented
    }
}

#endif
