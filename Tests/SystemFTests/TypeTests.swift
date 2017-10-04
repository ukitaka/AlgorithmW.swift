import XCTest
@testable import SystemF

class TypeTests: XCTestCase {
    func testType() {
        XCTAssertEqual(Type.typeVar("X"), Type.typeVar("X"))
        XCTAssertEqual(Type.int, Type.int)
        XCTAssertEqual(Type.bool, Type.bool)
    }
}
