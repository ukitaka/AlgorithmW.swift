import XCTest
@testable import SystemF

class SystemFTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(SystemF().text, "Hello, World!")
    }


    static var allTests = [
        ("testExample", testExample),
    ]
}
