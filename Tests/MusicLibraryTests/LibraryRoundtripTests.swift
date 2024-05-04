import XCTest
@testable import MusicLibrary

final class LibraryRoundtripTests: XCTestCase {
    func testEmpty() throws {
        try assertRoundtrips(Library())
    }

    func testBasicMetadata() throws {
        try assertRoundtrips(Library(
            apiMajorVersion: 2,
            apiMinorVersion: 3,
            applicationVersion: "abc.123",
            mediaFolderLocation: "C:\\Some/weird\\path"
        ))
    }

    private func assertRoundtrips(_ library: Library, line: UInt = #line) throws {
        try assertRoundtrips(library, LibraryJSONImporter.self, LibraryJSONExporter.self, line: line)
        try assertRoundtrips(library, LibraryXMLImporter.self, LibraryXMLExporter.self, line: line)
    }

    private func assertRoundtrips<Importer, Exporter>(
        _ library: Library,
        _ importer: Importer.Type,
        _ exporter: Exporter.Type,
        line: UInt = #line
    ) throws where Importer: DataLibraryImporter, Exporter: DataLibraryExporter {
        var encodedLibrary: Data? = nil
        let exporter = Exporter { data in
            encodedLibrary = data
        }
        try exporter.write(library: library)
        let importer = Importer(data: encodedLibrary!)
        let decodedLibrary = try importer.readLibrary()
        XCTAssertEqual(library, decodedLibrary, "\(Importer.self) -> \(Exporter.self) roundtrip failed", line: line)
    }
}

private protocol DataLibraryImporter: LibraryImporter {
    init(data: Data)
}

extension LibraryJSONImporter: DataLibraryImporter {}
extension LibraryXMLImporter: DataLibraryImporter {}

private protocol DataLibraryExporter: LibraryExporter {
    init(sink: @escaping (Data) throws -> Void)
}

extension LibraryJSONExporter: DataLibraryExporter {}
extension LibraryXMLExporter: DataLibraryExporter {}
