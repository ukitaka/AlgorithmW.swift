//
// Created by Yuki Takahashi on 2017/10/08.
//

import XCTest
@testable import AlgorithmW

class TypeInferenceTests: XCTestCase {
    func testTypeInferenceLiteral() {
        let env = TypeEnvironment()
        XCTAssertEqual(Inference.typeInference(env: env, term: Term.literal(.integer(10))), Type.integer)
    }

    func testTypeInference1() {
        let env = TypeEnvironment()
        let x = TypeVariable("x")
        let termX = Term.variable(x)
        let id = TypeVariable("id")
        let term = Term.let(id, .abstraction(x, termX), Term.variable(id))
        let inferredType = Inference.typeInference(env: env, term: term)
        if case let .function(arg, ret) = inferredType {
            XCTAssertEqual(arg, ret)
        } else {
            XCTFail()
        }
    }

    func testTypeInference2() {
        let env = TypeEnvironment()
        let x = TypeVariable("x")
        let termX = Term.variable(x)
        let id = TypeVariable("id")
        let termId = Term.variable(id)
        let one = Term.literal(Literal.integer(1))
        let term = Term.let(id, .abstraction(x, termX), Term.application(termId,  one))
        let inferredType = Inference.typeInference(env: env, term: term)
        XCTAssertEqual(inferredType, .integer)
    }

    func testTypeInference3() {
        let env = TypeEnvironment()
        let x = TypeVariable("x")
        let termX = Term.variable(x)
        let id = TypeVariable("id")
        let termId = Term.variable(id)
        let one = Term.literal(Literal.integer(1))
        let term = Term.let(id, .abstraction(x, termX),
                Term.application(Term.application(termId, termId),  one))
        let inferredType = Inference.typeInference(env: env, term: term)
        XCTAssertEqual(inferredType, .integer)
    }
}
