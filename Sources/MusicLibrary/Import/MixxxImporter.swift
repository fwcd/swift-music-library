import SQLite
import Foundation

private let home = FileManager.default.homeDirectoryForCurrentUser
#if os(macOS)
private let mixxxConfigRoot = "\(home)/Library/Containers/org.mixxx.mixxx/Data/Library/Application Support/Mixxx"
#elseif os(Windows)
private let mixxxConfigRoot = "\(home)/AppData/Local/Mixxx"
#else
private let mixxxConfigRoot = "\(home)/.mixxx"
#endif

private let library = Table("library")

private let id = Expression<Int>("id")
private let artist = Expression<String?>("artist")
private let albumArtist = Expression<String?>("album_artist")
private let composer = Expression<String?>("composer")
private let title = Expression<String?>("artist")
private let album = Expression<String?>("album")
private let year = Expression<String?>("year")
private let genre = Expression<String?>("genre")
private let trackNumber = Expression<String?>("tracknumber")
private let comment = Expression<String?>("comment")
private let url = Expression<String?>("url")
private let duration = Expression<Double?>("duration")
private let bitrate = Expression<Int?>("bitrate")
private let sampleRate = Expression<Int?>("samplerate")
private let cuePoint = Expression<Int?>("cuepoint")
private let bpm = Expression<Double?>("bpm")
private let channels = Expression<Int?>("channels")
private let played = Expression<Int?>("played")

// TODO: Locations, ratings, perhaps keys etc.

public struct MixxxImporter: LibraryImporter {
    private let db: Connection

    public init(dbFilePath: String) throws {
        db = try Connection(dbFilePath, readonly: true)
    }

    public init() throws {
        try self.init(dbFilePath: "\(mixxxConfigRoot)/mixxxdb.sqlite")
    }

    public func readLibrary() throws -> Library {
        var tracks: [Int: Track] = [:]

        for track in try db.prepare(library) {
            let trackId = track[id]
            tracks[trackId] = Track(
                id: trackId,
                title: track[title],
                artist: track[artist],
                albumArtist: track[albumArtist],
                composer: track[composer],
                album: track[album],
                genre: track[genre],
                mediaKind: .song,
                totalTime: track[duration].map { Int($0 * 1000) },
                trackNumber: track[trackNumber].flatMap { Int($0) },
                year: track[year].flatMap { Int($0) },
                bpm: track[bpm].map { Int($0) },
                playCount: track[played]
            )
        }

        // TODO: Playlists

        return Library(tracks: tracks)
    }
}
