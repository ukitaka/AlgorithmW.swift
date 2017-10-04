import XCTest
@testable import AlgorithmW

class TypeTests: XCTestCase {
    func testType() {
        XCTAssertEqual(Type.var("X"), Type.var("X"))
        XCTAssertNotEqual(Type.var("X"), Type.var("Y"))
        XCTAssertEqual(Type.int, Type.int)
        XCTAssertEqual(Type.bool, Type.bool)
        XCTAssertEqual(Type.fun(.bool, .int), Type.fun(.bool, .int))
    }
}
