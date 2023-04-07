#if canImport(iTunesLibrary)

import iTunesLibrary

/// An importer for the local Apple Music library using
/// the iTunes Library framework. Only for macOS.
public struct LocalAppleMusicITImporter: LibraryImporter {
    private let itLib: ITLibrary

    public init(itLib: ITLibrary) {
        self.itLib = itLib
    }

    public init() throws {
        self.init(itLib: try ITLibrary(apiVersion: "1.0"))
    }

    public func readLibrary() throws -> Library {
        try Library(itLib)
    }
}

extension Library {
    init(_ itLib: ITLibrary) throws {
        self.init(
            apiMajorVersion: itLib.apiMajorVersion,
            apiMinorVersion: itLib.apiMinorVersion,
            lastModifiedDate: itLib.value(forKey: "_lastModifiedDate") as? Date,
            applicationVersion: itLib.applicationVersion,
            features: itLib.features.rawValue,
            showContentRatings: itLib.shouldShowContentRating,
            musicFolder: itLib.mediaFolderLocation?.absoluteString,
            persistentId: (itLib.value(forKey: "_persistentID") as? Int64).map { String($0, radix: 16, uppercase: true) }
        )
    }
}

#endif
