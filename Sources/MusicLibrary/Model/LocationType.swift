/// A track location kind.
public struct LocationType: RawRepresentable, Codable, Hashable, Sendable {
    public var rawValue: String

    public static var file = Self(rawValue: "File")
    public static var remote = Self(rawValue: "Remote")
    public static var url = Self(rawValue: "URL")

    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}
