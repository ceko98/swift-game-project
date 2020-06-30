import XCTest
@testable import swift_game_project

final class swift_game_projectTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(swift_game_project().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
