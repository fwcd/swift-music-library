import Foundation

extension FileManager {
    func fileSize(atPath path: String) throws -> UInt64 {
        let attributes = try attributesOfItem(atPath: path)
        return attributes[FileAttributeKey.size] as! UInt64
    }
}
