import Foundation

/// A facility for serializing values.
public protocol TopLevelEncoder {
    associatedtype Output

    /// Encodes the given value.
    func encode<Value>(_ value: Value) throws -> Output where Value: Encodable
}

extension JSONEncoder: TopLevelEncoder {}

extension PropertyListEncoder: TopLevelEncoder {}
