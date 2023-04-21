import Foundation

/// A list of tracks.
public struct Playlist: Codable, Hashable, Identifiable {
    public enum CodingKeys: String, CodingKey {
        case name = "Name"
        case description = "Description"
        case isPrimary = "Master"
        case isVisible = "Visible"
        case id = "Playlist ID"
        case persistentId = "Playlist Persistent ID"
        case parentPersistentId = "Parent Persistent ID"
        case allItems = "All Items"
        case isFolder = "Folder"
        case items = "Playlist Items"
    }

    // TODO: Encode distinguished kind (<key>Music</key><true/> etc.)

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
    public var distinguishedKind: PlaylistDistinguishedKind? = nil
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
        distinguishedKind: PlaylistDistinguishedKind? = nil,
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
        self.distinguishedKind = distinguishedKind
        self.items = items
    }
}
