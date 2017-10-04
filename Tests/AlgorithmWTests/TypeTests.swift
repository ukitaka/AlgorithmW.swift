import XCTest
@testable import AlgorithmW

class TypeTests: XCTestCase {
    func testType() {
        XCTAssertEqual(Type.typeVar("X"), Type.typeVar("X"))
        XCTAssertNotEqual(Type.typeVar("X"), Type.typeVar("Y"))
        XCTAssertEqual(Type.int, Type.int)
        XCTAssertEqual(Type.bool, Type.bool)
    }
}
