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

    func testTracks() throws {
        // NOTE: We pin dates to a non-fractional value due to the inherent loss
        // of precision in ISO8601-encoded dates.
        try assertRoundtrips(Library(
            apiMajorVersion: 4,
            apiMinorVersion: 1,
            lastModifiedDate: Date(timeIntervalSince1970: 12000),
            applicationVersion: "4.9.3.3",
            features: 0,
            showContentRatings: true,
            mediaFolderLocation: "/Users/me/Music/Media",
            persistentId: "ABCDEFG987654321",
            tracks: [
                -100: Track(id: -100, title: "Hello", artist: "Alice"),
                10: Track(
                    id: 10,
                    title: "Test Title",
                    artist: "Test Artist",
                    albumArtist: "Test Album Artist",
                    composer: "Test Composer",
                    album: "Test Album",
                    grouping: "Test Grouping",
                    genre: "Pop",
                    fileSize: 1000,
                    totalTime: 200,
                    discNumber: 1,
                    discCount: 2,
                    trackNumber: 4,
                    trackCount: 12,
                    year: 2008,
                    skipCount: 1,
                    skipDate: Date(timeIntervalSince1970: 17000),
                    bpm: 128,
                    dateModified: Date(timeIntervalSince1970: 14000),
                    dateAdded: Date(timeIntervalSince1970: 18000),
                    bitRate: 320,
                    sampleRate: 44100,
                    playCount: 20,
                    playDateUtc: Date(timeIntervalSince1970: 19000),
                    sortAlbum: "Test Sort Album",
                    sortArtist: "Test Sort Artist",
                    sortTitle: "Test Sort Title",
                    sortComposer: "Test Sort Composer",
                    persistentId: "QWERTZIOP",
                    isPurchased: false,
                    location: "/Users/me/Music/Media/Test Title.mp3",
                    locationType: .file
                ),
            ]
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
