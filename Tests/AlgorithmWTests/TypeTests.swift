import XCTest
@testable import AlgorithmW

class TypeTests: XCTestCase {
    func testType() {
        XCTAssertEqual(Type.typeVar("X"), Type.typeVar("X"))
        XCTAssertNotEqual(Type.typeVar("X"), Type.typeVar("Y"))
        XCTAssertEqual(Type.integer, Type.integer)
        XCTAssertEqual(Type.boolean, Type.boolean)
        XCTAssertEqual(Type.function(.boolean, .integer), Type.function(.boolean, .integer))
    }
}
