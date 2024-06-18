import XCTest
@testable import MusicLibrary

final class CopyProcessorTests: XCTestCase {
    func testSkipPredicate() {
        let a = URL(fileURLWithPath: "/tmp/this-file-probably-does-not-exist-830649")
        let b = URL(fileURLWithPath: "/tmp/this-file-probably-does-not-exist-159224")

        XCTAssertEqual(CopyProcessor.SkipPredicate.always.skipReason(oldURL: a, newURL: b), "always")

        XCTAssertEqual(CopyProcessor.SkipPredicate.and([]).skipReason(oldURL: a, newURL: b), "empty and")
        XCTAssertEqual(CopyProcessor.SkipPredicate.and([.always]).skipReason(oldURL: a, newURL: b), "always")
        XCTAssertEqual(CopyProcessor.SkipPredicate.and([.always, .always]).skipReason(oldURL: a, newURL: b), "always and always")
        XCTAssertNil(CopyProcessor.SkipPredicate.and([.never]).skipReason(oldURL: a, newURL: b))
        XCTAssertNil(CopyProcessor.SkipPredicate.and([.always, .never]).skipReason(oldURL: a, newURL: b))
        XCTAssertNil(CopyProcessor.SkipPredicate.and([.never, .always]).skipReason(oldURL: a, newURL: b))
        XCTAssertNil(CopyProcessor.SkipPredicate.and([.never, .never]).skipReason(oldURL: a, newURL: b))

        XCTAssertNil(CopyProcessor.SkipPredicate.or([]).skipReason(oldURL: a, newURL: b))
        XCTAssertNil(CopyProcessor.SkipPredicate.or([.never]).skipReason(oldURL: a, newURL: b), "always")
        XCTAssertEqual(CopyProcessor.SkipPredicate.or([.always]).skipReason(oldURL: a, newURL: b), "always")
        XCTAssertEqual(CopyProcessor.SkipPredicate.or([.always, .always]).skipReason(oldURL: a, newURL: b), "always")
        XCTAssertEqual(CopyProcessor.SkipPredicate.or([.never, .always]).skipReason(oldURL: a, newURL: b), "always")
        XCTAssertEqual(CopyProcessor.SkipPredicate.or([.always, .never]).skipReason(oldURL: a, newURL: b), "always")
    }
}
