#if canImport(iTunesLibrary)

import iTunesLibrary

/// An importer for the local Apple Music library using
/// the iTunes Library framework. Only for macOS.
public struct LocalAppleMusicITImporter: LibraryImporter {
    private let itLib: ITLibrary
    private let indexing: Indexing<NSNumber> = .init()

    public init(itLib: ITLibrary) {
        self.itLib = itLib
    }

    public init() throws {
        self.init(itLib: try ITLibrary(apiVersion: "1.0"))
    }

    public func readLibrary() throws -> Library {
        try Library(itLib, indexing: indexing)
    }
}

extension Library {
    init(_ itLib: ITLibrary, indexing: Indexing<NSNumber>) throws {
        var tracks = [Int: Track]()
        for item in itLib.allMediaItems {
            let track = Track(item, indexing: indexing)
            tracks[track.id] = track
        }

        var playlists = [Playlist]()
        for itPlaylist in itLib.allPlaylists {
            let playlist = Playlist(itPlaylist, indexing: indexing)
            playlists.append(playlist)
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
            tracks: tracks,
            playlists: playlists
        )
    }
}

extension Track {
    init(_ item: ITLibMediaItem, indexing: Indexing<NSNumber>) {
        let id = indexing.index(for: item.persistentID)
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
            persistentId: formatPersistentId(item.persistentID),
            isPurchased: item.isPurchased,
            location: item.location?.absoluteString,
            locationType: LocationType(item.locationType)
        )
    }
}

extension LocationType {
    init?(_ locationType: ITLibMediaItemLocationType) {
        switch locationType {
        case .file: self = .file
        case .remote: self = .remote
        case .URL: self = .url
        default: return nil
        }
    }
}

extension Playlist {
    init(_ playlist: ITLibPlaylist, indexing: Indexing<NSNumber>) {
        let isPrimary: Bool
        if #available(macOS 12.0, *) {
            isPrimary = playlist.isPrimary
        } else {
            isPrimary = playlist.isMaster
        }
        let id = indexing.index(for: playlist.persistentID)
        self.init(
            id: id,
            name: playlist.name,
            isPrimary: isPrimary,
            persistentId: formatPersistentId(playlist.persistentID),
            parentPersistentId: playlist.parentID.map { formatPersistentId($0) },
            isFolder: playlist.kind == .folder,
            items: playlist.items.map { TrackReference($0, indexing: indexing) }
        )
    }
}

extension TrackReference {
    init(_ item: ITLibMediaItem, indexing: Indexing<NSNumber>) {
        let id = indexing.index(for: item.persistentID)
        self.init(
            trackId: id
        )
    }
}

private func formatPersistentId(_ raw: NSNumber) -> String {
    String(format: "%llX", raw.uint64Value)
}

#endif
