/// An index mapping from some user-defined key.
public class Indexing<Key> where Key: Hashable {
    private var mapping: [Key: Int] = [:]

    public func index(for key: Key) -> Int {
        if let value = mapping[key] {
            return value
        } else {
            let value = mapping.count
            mapping[key] = value
            return value
        }
    }
}
