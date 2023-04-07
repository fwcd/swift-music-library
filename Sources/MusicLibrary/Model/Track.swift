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
        case rating = "Rating"
        case genre = "Genre"
        case kind = "Kind"
        case fileSize = "Size"
        case totalTime = "Total Time"
        case discNumber = "Disc Number"
        case discCount = "Disc Count"
        case trackNumber = "Track Number"
        case trackCount = "Track Count"
        case year = "Year"
        case skipCount = "Skip Count"
        case skipDate = "Skip Date"
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

    /// The ID, corresponding to the key in `Library.tracks`.
    public var id: Int
    /// The title of the track.
    public var title: String?
    /// Information about the artist that iTunes associates with the track.
    public var artist: String?
    /// The artist of the track's album.
    public var albumArtist: String?
    /// The title of the track's album.
    public var album: String?
    /// The name of the composer that iTunes associates with the track.
    public var composer: String?
    /// The rating of the media item.
    public var rating: Int?
    /// The genre of the track, if any.
    public var genre: String?
    /// The kind of track file, such as an MPEG audio file.
    public var kind: String?
    /// The kind of track.
    public var mediaKind: MediaKind?
    /// The size in bytes of this track on disk.
    public var fileSize: UInt64?
    /// The length of the track in milliseconds.
    public var totalTime: Int?
    /// The disc number in the track’s album.
    public var discNumber: Int?
    /// The number of discs in the track’s album.
    public var discCount: Int?
    /// The position of the track within its album.
    public var trackNumber: Int?
    /// The track count of the track’s album.
    public var trackCount: Int?
    /// The release year of the track.
    public var year: Int?
    /// The number of times that the user skipped the media item.
    public var skipCount: Int?
    /// The date and time that the user last skipped the media item.
    public var skipDate: Date?
    /// The beats-per-minute (BPM) of the track.
    public var bpm: Int?
    /// The date and time that iTunes last modified the track.
    public var dateModified: Date?
    /// The date and time that the user added the track to the iTunes library.
    public var dateAdded: Date?
    /// The bitrate of the track in kbit/s.
    public var bitRate: Int?
    /// The sample rate of the track in samples-per-second.
    public var sampleRate: Int?
    /// Any comments that iTunes associates with the track.
    public var comments: String?
    /// The number of times the user has played the track.
    public var playCount: Int?
    /// The date and time the user last played the track, or nil if the user hasn’t played it.
    public var playDate: Int?
    /// The date and time the user last played the track, or nil if the user hasn’t played it.
    public var playDateUtc: Date?
    /// The volume normalization energy that iTunes applies to the track to bring the average or peak amplitude to a target level.
    public var volumeNormalizationEnergy: Int?
    /// The release date of the track.
    public var releaseDate: Date?
    /// The number of artwork images associated with the track.
    public var artworkCount: Int?
    /// The title of the album to use when sorting.
    public var sortAlbum: String?
    /// The name of the artist to use when sorting.
    public var sortArtist: String?
    /// The title of the track to use when sorting.
    public var sortTitle: String?
    /// The name to use when sorting by composer.
    public var sortComposer: String?
    /// The persistent ID of the track.
    public var persistentId: String?
    /// A Boolean value that indicates whether the user purchased the track from the iTunes Store.
    public var isPurchased: Bool?
    /// The location of the track on disk.
    public var location: String?
    /// The type of the track with respect to its location.
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
        rating: Int? = nil,
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
        skipCount: Int? = nil,
        skipDate: Date? = nil,
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
        self.rating = rating
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
        self.skipCount = skipCount
        self.skipDate = skipDate
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
