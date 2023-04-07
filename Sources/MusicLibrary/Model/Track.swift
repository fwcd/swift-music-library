import Foundation

/// A track/song.
public struct Track: Codable, Hashable, Identifiable {
    public var id: Int
    public var name: String?
    public var artist: String?
    public var albumArtist: String?
    public var album: String?
    public var genre: String?
    public var kind: String?
    public var size: Int?
    public var totalTime: Int?
    public var discNumber: Int?
    public var discCount: Int?
    public var trackNumber: Int?
    public var trackCount: Int?
    public var year: Int?
    public var bpm: Int?
    public var dateModified: Date?
    public var dateAdded: Date?
    public var bitRate: Int?
    public var sampleRate: Int?
    public var comments: String?
    public var playCount: Int?
    public var playDate: Int?
    public var playDateUtc: Date?
    public var normalization: Int?
    public var releaseDate: Date?
    public var artworkCount: Int?
    public var sortAlbum: String?
    public var sortArtist: String?
    public var sortName: String?
    public var persistentId: String?
    public var trackType: TrackType?
    public var purchased: Bool?
    public var location: String?
    public var fileFolderCount: Int?
    public var libraryFolderCount: Int?

    public init(
        id: Int,
        name: String? = nil,
        artist: String? = nil,
        albumArtist: String? = nil,
        album: String? = nil,
        genre: String? = nil,
        kind: String? = nil,
        size: Int? = nil,
        totalTime: Int? = nil,
        discNumber: Int? = nil,
        discCount: Int? = nil,
        trackNumber: Int? = nil,
        trackCount: Int? = nil,
        year: Int? = nil,
        bpm: Int? = nil,
        dateModified: Date? = nil,
        dateAdded: Date? = nil,
        bitRate: Int? = nil,
        sampleRate: Int? = nil,
        comments: String? = nil,
        playCount: Int? = nil,
        playDate: Int? = nil,
        playDateUtc: Date? = nil,
        normalization: Int? = nil,
        releaseDate: Date? = nil,
        artworkCount: Int? = nil,
        sortAlbum: String? = nil,
        sortArtist: String? = nil,
        sortName: String? = nil,
        persistentId: String? = nil,
        trackType: TrackType? = nil,
        purchased: Bool? = nil,
        location: String? = nil,
        fileFolderCount: Int? = nil,
        libraryFolderCount: Int? = nil
    ) {
        self.id = id
        self.name = name
        self.artist = artist
        self.albumArtist = albumArtist
        self.album = album
        self.genre = genre
        self.kind = kind
        self.size = size
        self.totalTime = totalTime
        self.discNumber = discNumber
        self.discCount = discCount
        self.trackNumber = trackNumber
        self.trackCount = trackCount
        self.year = year
        self.bpm = bpm
        self.dateModified = dateModified
        self.dateAdded = dateAdded
        self.bitRate = bitRate
        self.sampleRate = sampleRate
        self.comments = comments
        self.playCount = playCount
        self.playDate = playDate
        self.playDateUtc = playDateUtc
        self.normalization = normalization
        self.releaseDate = releaseDate
        self.artworkCount = artworkCount
        self.sortAlbum = sortAlbum
        self.sortArtist = sortArtist
        self.sortName = sortName
        self.persistentId = persistentId
        self.trackType = trackType
        self.purchased = purchased
        self.location = location
        self.fileFolderCount = fileFolderCount
        self.libraryFolderCount = libraryFolderCount
    }
}
