#if os(iOS) || targetEnvironment(macCatalyst)

import MediaPlayer

/// An importer for the local media library using
/// the Media Player framework. Primarily intended for iOS.
public struct LocalAppleMediaMPImporter: LibraryImporter {
    public func readLibrary() throws -> Library {
        let indexing = Indexing<MPMediaEntityPersistentID>()
        
        var tracks = [Int: Track]()
        for mpItem in MPMediaQuery.songs().items ?? [] {
            let track = Track(mpItem, indexing: indexing)
            tracks[track.id] = track
        }

        var playlists = [Playlist]()
        for mpCollection in MPMediaQuery.playlists().collections ?? [] {
            if let mpPlaylist = mpCollection as? MPMediaPlaylist {
                let playlist = Playlist(mpPlaylist, indexing: indexing)
                playlists.append(playlist)
            }
        }
        
        return Library(
            tracks: tracks,
            playlists: playlists
        )
    }
}

extension Track {
    init(_ item: MPMediaItem, indexing: Indexing<MPMediaEntityPersistentID>) {
        let id = indexing.index(for: item.persistentID)
        self.init(
            id: id,
            title: item.title,
            artist: item.artist,
            albumArtist: item.albumArtist,
            album: item.albumTitle,
            rating: item.rating,
            composer: item.composer,
            genre: item.genre,
            mediaKind: MediaKind(item.mediaType),
            totalTime: Int(item.playbackDuration * 1000),
            discNumber: item.discNumber,
            discCount: item.discCount,
            trackNumber: item.albumTrackNumber,
            trackCount: item.albumTrackCount,
            bpm: item.beatsPerMinute,
            dateAdded: item.dateAdded,
            comments: item.comments,
            playCount: item.playCount,
            playDate: item.lastPlayedDate.map { Int($0.timeIntervalSince1970) },
            playDateUtc: item.lastPlayedDate,
            releaseDate: item.releaseDate,
            artworkCount: item.artwork != nil ? 1 : 0,
            persistentId: formatPersistentId(item.persistentID)
        )
    }
}

extension MediaKind {
    init?(_ mediaType: MPMediaType) {
        switch mediaType {
        case .music: self = .song
        case .movie: self = .movie
        case .podcast: self = .podcast
        case .audioBook: self = .audiobook
        case .audioITunesU: self = .iTunesU
        case .homeVideo: self = .homeVideo
        case .musicVideo: self = .musicVideo
        case .tvShow: self = .tvShow
        default: return nil
        }
    }
}

extension Playlist {
    init(_ playlist: MPMediaPlaylist, indexing: Indexing<MPMediaEntityPersistentID>) {
        let id = indexing.index(for: playlist.persistentID)
        self.init(
            id: id,
            name: playlist.name,
            persistentId: formatPersistentId(playlist.persistentID),
            items: playlist.items.map { TrackReference($0, indexing: indexing) }
        )
    }
}

extension TrackReference {
    init(_ item: MPMediaItem, indexing: Indexing<MPMediaEntityPersistentID>) {
        let id = indexing.index(for: item.persistentID)
        self.init(
            trackId: id
        )
    }
}

private func formatPersistentId(_ raw: MPMediaEntityPersistentID) -> String {
    String(format: "%llX", raw)
}


#endif
