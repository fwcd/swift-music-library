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
        var tracks = [Int: Track]()
        for item in itLib.allMediaItems {
            let id = tracks.count
            tracks[id] = Track(item, id: id)
        }

        self.init(
            apiMajorVersion: itLib.apiMajorVersion,
            apiMinorVersion: itLib.apiMinorVersion,
            lastModifiedDate: itLib.value(forKey: "_lastModifiedDate") as? Date,
            applicationVersion: itLib.applicationVersion,
            features: itLib.features.rawValue,
            showContentRatings: itLib.shouldShowContentRating,
            mediaFolderLocation: itLib.mediaFolderLocation?.absoluteString,
            persistentId: (itLib.value(forKey: "_persistentID") as? Int64).map { String($0, radix: 16, uppercase: true) },
            tracks: tracks
        )
    }
}

extension Track {
    init(_ item: ITLibMediaItem, id: Int) {
        self.init(
            id: id,
            name: item.title,
            artist: item.artist?.name,
            albumArtist: item.album.albumArtist,
            album: item.album.title,
            composer: item.composer,
            genre: item.genre,
            kind: item.kind,
            fileSize: item.fileSize,
            totalTime: item.totalTime,
            discNumber: item.album.discNumber,
            discCount: item.album.discCount,
            trackNumber: item.trackNumber,
            trackCount: item.album.trackCount,
            year: item.year,
            bpm: item.beatsPerMinute,
            dateModified: item.modifiedDate,
            dateAdded: item.addedDate,
            bitRate: item.bitrate,
            sampleRate: item.sampleRate,
            comments: item.comments,
            playCount: item.playCount,
            playDate: item.lastPlayedDate.map { Int($0.timeIntervalSince1970) },
            playDateUtc: item.lastPlayedDate,
            volumeNormalizationEnergy: item.volumeNormalizationEnergy,
            releaseDate: item.releaseDate,
            artworkCount: item.hasArtworkAvailable ? 1 : 0,
            sortAlbum: item.album.sortTitle,
            sortArtist: item.artist?.sortName,
            sortName: item.sortTitle,
            sortComposer: item.sortComposer,
            persistentId: String(format: "%llX", item.persistentID.uint64Value),
            isPurchased: item.isPurchased,
            location: item.location?.absoluteString,
            locationType: TrackType(item.locationType)
        )
    }
}

extension TrackType {
    init?(_ locationType: ITLibMediaItemLocationType) {
        switch locationType {
        case .file: self = .file
        case .remote: self = .remote
        case .URL: self = .url
        default: return nil
        }
    }
}

#endif
