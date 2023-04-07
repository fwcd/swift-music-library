import Foundation

/// A facility for deserializing values.
public protocol TopLevelDecoder {
    associatedtype Input

    /// Decodes the given type.
    func decode<Value>(_ type: Value.Type, from input: Input) throws -> Value where Value: Decodable
}

extension JSONDecoder: TopLevelDecoder {}

extension PropertyListDecoder: TopLevelDecoder {}
