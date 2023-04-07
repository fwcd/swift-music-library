import Foundation

/// A track/song.
public struct Track: Codable, Hashable, Identifiable {
    public enum CodingKeys: String, CodingKey {
        case id = "Track ID"
        case title = "Name"
        case artist = "Artist"
        case albumArtist = "Album Artist"
        case album = "Album"
        case composer = "Composer"
        case genre = "Genre"
        case kind = "Kind"
        case fileSize = "Size"
        case totalTime = "Total Time"
        case discNumber = "Disc Number"
        case discCount = "Disc Count"
        case trackNumber = "Track Number"
        case trackCount = "Track Count"
        case year = "Year"
        case bpm = "BPM"
        case dateModified = "Date Modified"
        case dateAdded = "Date Added"
        case bitRate = "Bit Rate"
        case sampleRate = "Sample Rate"
        case comments = "Comments"
        case playCount = "Play Count"
        case playDate = "Play Date"
        case playDateUtc = "Play Date UTC"
        case volumeNormalizationEnergy = "Normalization"
        case releaseDate = "Release Date"
        case artworkCount = "Artwork Count"
        case sortAlbum = "Sort Album"
        case sortArtist = "Sort Artist"
        case sortComposer = "Sort Composer"
        case sortTitle = "Sort Name"
        case persistentId = "Persistent ID"
        case isPurchased = "Purchased"
        case location = "Location"
        case locationType = "Track Type"
        case fileFolderCount = "File Folder Count"
        case libraryFolderCount = "Library Folder Count"
    }

    public var id: Int
    public var title: String?
    public var artist: String?
    public var albumArtist: String?
    public var album: String?
    public var composer: String?
    public var genre: String?
    public var kind: String?
    public var mediaKind: MediaKind?
    public var fileSize: UInt64?
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
    public var volumeNormalizationEnergy: Int?
    public var releaseDate: Date?
    public var artworkCount: Int?
    public var sortAlbum: String?
    public var sortArtist: String?
    public var sortTitle: String?
    public var sortComposer: String?
    public var persistentId: String?
    public var isPurchased: Bool?
    public var location: String?
    public var locationType: LocationType?
    public var fileFolderCount: Int?
    public var libraryFolderCount: Int?

    public init(
        id: Int,
        title: String? = nil,
        artist: String? = nil,
        albumArtist: String? = nil,
        album: String? = nil,
        composer: String? = nil,
        genre: String? = nil,
        kind: String? = nil,
        mediaKind: MediaKind? = nil,
        fileSize: UInt64? = nil,
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
        volumeNormalizationEnergy: Int? = nil,
        releaseDate: Date? = nil,
        artworkCount: Int? = nil,
        sortAlbum: String? = nil,
        sortArtist: String? = nil,
        sortTitle: String? = nil,
        sortComposer: String? = nil,
        persistentId: String? = nil,
        isPurchased: Bool? = nil,
        location: String? = nil,
        locationType: LocationType? = nil,
        fileFolderCount: Int? = nil,
        libraryFolderCount: Int? = nil
    ) {
        self.id = id
        self.title = title
        self.artist = artist
        self.albumArtist = albumArtist
        self.album = album
        self.composer = composer
        self.genre = genre
        self.kind = kind
        self.mediaKind = mediaKind
        self.fileSize = fileSize
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
        self.volumeNormalizationEnergy = volumeNormalizationEnergy
        self.releaseDate = releaseDate
        self.artworkCount = artworkCount
        self.sortAlbum = sortAlbum
        self.sortArtist = sortArtist
        self.sortTitle = sortTitle
        self.sortComposer = sortComposer
        self.persistentId = persistentId
        self.isPurchased = isPurchased
        self.location = location
        self.locationType = locationType
        self.fileFolderCount = fileFolderCount
        self.libraryFolderCount = libraryFolderCount
    }
}
