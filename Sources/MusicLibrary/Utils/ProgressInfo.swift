public struct ProgressInfo {
    public var current: Int
    public var total: Int?
    public var message: String?

    public init(
        current: Int = -1,
        total: Int? = nil,
        message: String? = nil
    ) {
        self.current = current
        self.total = total
        self.message = message
    }

    public mutating func increment(message: String? = nil) {
        current += 1
        self.message = message
    }

    public mutating func update(current: Int? = nil, total: Int? = nil, message: String? = nil) {
        self.current = current ?? self.current
        self.total = total ?? self.total
        self.message = message ?? self.message
    }
}
