public struct TrackType: RawRepresentable, Codable, Hashable {
    public var rawValue: String

    public static var file = Self(rawValue: "File")
    public static var remote = Self(rawValue: "Remote")

    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}
