//
// Created by Yuki Takahashi on 2017/10/07.
//

struct Inference {
    static func typeInferenceLiteral(env: TypeEnvironment, literal: Literal) -> (Substitution, Type) {
        switch literal {
        case .integer:
            return (Substitution(), .integer)
        case .boolean:
            return (Substitution(), .boolean)
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
        case let .literal(literal):
            return typeInferenceLiteral(env: env, literal: literal)
        default:
            fatalError()
        }
    }
}
