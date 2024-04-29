public struct ProgressInfo {
    public var current: Int
    public var total: Int
    public var message: String? = nil

    public mutating func update(current: Int? = nil, total: Int? = nil, message: String? = nil) {
        self.current = current ?? self.current
        self.total = total ?? self.total
        self.message = message ?? self.message
    }
}
