import Foundation

/// A music library.
public struct Library: Codable, Hashable {
    public enum CodingKeys: String, CodingKey {
        case majorVersion = "Major Version"
        case minorVersion = "Minor Version"
        case date = "Date"
        case applicationVersion = "Application Version"
        case features = "Features"
        case showContentRatings = "Show Content Ratings"
        case musicFolder = "Music Folder"
        case persistentId = "Persistent ID"
        case tracks = "Tracks"
    }

    public var majorVersion: Int?
    public var minorVersion: Int?
    public var date: Date?
    public var applicationVersion: String?
    public var features: Int?
    public var showContentRatings: Bool
    public var musicFolder: String?
    public var persistentId: String?
    public var tracks: [Int: Track]
    public var playlists: [Playlist] = []

    public init(
        majorVersion: Int? = nil,
        minorVersion: Int? = nil,
        date: Date? = nil,
        applicationVersion: String? = nil,
        features: Int? = nil,
        showContentRatings: Bool = true,
        musicFolder: String? = nil,
        persistentId: String? = nil,
        tracks: [Int: Track] = [:],
        playlists: [Playlist] = []
    ) {
        self.persistentId = persistentId
        self.majorVersion = majorVersion
        self.minorVersion = minorVersion
        self.date = date
        self.applicationVersion = applicationVersion
        self.features = features
        self.showContentRatings = showContentRatings
        self.musicFolder = musicFolder
        self.persistentId = persistentId
        self.tracks = tracks
        self.playlists = playlists
    }
}
