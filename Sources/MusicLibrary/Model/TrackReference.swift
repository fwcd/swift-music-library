/// The reference to a track in the library.
public struct TrackReference: Codable, Hashable, Sendable {
    public enum CodingKeys: String, CodingKey {
        case trackId = "Track ID"
    }

    public var trackId: Int
}
