import SQLite
import Foundation

#if os(macOS)
private let mixxxConfigRoot = "~/Library/Containers/org.mixxx.mixxx/Data/Library/Application Support/Mixxx"
#elseif os(Windows)
private let mixxxConfigRoot = "~/AppData/Local/Mixxx"
#else
private let mixxxConfigRoot = "~/.mixxx"
#endif

public struct MixxxImporter: LibraryImporter {
    private let db: Connection

    public init(dbFilePath: String) throws {
        db = try Connection(dbFilePath, readonly: true)
    }

    public init() throws {
        try self.init(dbFilePath: "\(mixxxConfigRoot)/mixxxdb.sqlite")
    }

    public func readLibrary() throws -> Library {
        throw LibraryImportError.notImplemented
    }
}
