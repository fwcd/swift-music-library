public struct ProgressInfo {
    public var current: Int = -1
    public var total: Int? = nil
    public var message: String? = nil

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
