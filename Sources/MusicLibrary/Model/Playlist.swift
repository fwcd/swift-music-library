import Foundation

/// A list of tracks.
public struct Playlist: Codable, Hashable, Identifiable {
    public enum CodingKeys: String, CodingKey {
        case id = "Playlist ID"
        case name = "Name"
        case description = "Description"
        case isPrimary = "Master"
        case persistentId = "Persistent ID"
        case parentPersistentId = "Parent Persistent ID"
        case allItems = "All Items"
        case isFolder = "Folder"
        case isVisible = "Visible"
        case items = "Playlist Items"
    }

    public var id: Int
    public var name: String?
    public var description: String?
    public var isPrimary: Bool?
    public var persistentId: String?
    public var parentPersistentId: String?
    public var allItems: Bool
    public var isFolder: Bool?
    public var isVisible: Bool
    // TODO: Decode this using @CustomCodable, see https://github.com/cvzi/itunes_smartplaylist
    public var smartInfo: Data?
    public var smartCriteria: Data?
    public var kind: PlaylistKind?
    public var items: [TrackReference]

    public init(
        id: Int,
        name: String? = nil,
        description: String? = nil,
        isPrimary: Bool? = nil,
        persistentId: String? = nil,
        parentPersistentId: String? = nil,
        allItems: Bool = true,
        isFolder: Bool? = nil,
        isVisible: Bool = true,
        kind: PlaylistKind? = nil,
        items: [TrackReference] = []
    ) {
        self.id = id
        self.name = name
        self.description = description
        self.isPrimary = isPrimary
        self.persistentId = persistentId
        self.parentPersistentId = parentPersistentId
        self.allItems = allItems
        self.isFolder = isFolder
        self.isVisible = isVisible
        self.kind = kind
        self.items = items
    }
}
