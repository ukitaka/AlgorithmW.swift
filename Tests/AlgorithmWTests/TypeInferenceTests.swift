//
// Created by Yuki Takahashi on 2017/10/08.
//

import XCTest
@testable import AlgorithmW

class TypeInferenceTests: XCTestCase {
    func testTypeInference() {
        let env = TypeEnvironment()
        XCTAssertEqual(Inference.typeInference(env: env, term: Term.literal(.integer(10))), Type.integer)
    }
}
