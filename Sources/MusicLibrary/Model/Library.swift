import Foundation

/// A music library.
public struct Library: Codable, Hashable {
    public enum CodingKeys: String, CodingKey {
        case apiMajorVersion = "Major Version"
        case apiMinorVersion = "Minor Version"
        case lastModifiedDate = "Date"
        case applicationVersion = "Application Version"
        case features = "Features"
        case showContentRatings = "Show Content Ratings"
        case mediaFolderLocation = "Music Folder"
        case persistentId = "Persistent ID"
        case tracks = "Tracks"
    }

    public var apiMajorVersion: Int?
    public var apiMinorVersion: Int?
    public var lastModifiedDate: Date?
    public var applicationVersion: String?
    public var features: UInt?
    public var showContentRatings: Bool
    public var mediaFolderLocation: String?
    public var persistentId: String?
    public var tracks: [Int: Track]
    public var playlists: [Playlist] = []

    public init(
        apiMajorVersion: Int? = nil,
        apiMinorVersion: Int? = nil,
        lastModifiedDate: Date? = nil,
        applicationVersion: String? = nil,
        features: UInt? = nil,
        showContentRatings: Bool = true,
        mediaFolderLocation: String? = nil,
        persistentId: String? = nil,
        tracks: [Int: Track] = [:],
        playlists: [Playlist] = []
    ) {
        self.persistentId = persistentId
        self.apiMajorVersion = apiMajorVersion
        self.apiMinorVersion = apiMinorVersion
        self.lastModifiedDate = lastModifiedDate
        self.applicationVersion = applicationVersion
        self.features = features
        self.showContentRatings = showContentRatings
        self.mediaFolderLocation = mediaFolderLocation
        self.persistentId = persistentId
        self.tracks = tracks
        self.playlists = playlists
    }
}
