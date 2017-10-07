//
// Created by Yuki Takahashi on 2017/10/07.
//

struct Inference {
    static func typeInferenceLiteral(env: TypeEnvironment, literal: Literal) -> Type {
        switch literal {
        case .integer:
            return .integer
        case .boolean:
            return .boolean
        }
    }

    static func typeInference(env: TypeEnvironment, term: Term) -> (Substitution, Type) {
        switch term {
        case let .variable(variable):
            if let scheme = env[variable] {
                return (Substitution(), scheme.instantiate())
            } else {
                fatalError()
            }
        default:
            fatalError()
        }
    }
}
