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

    static func typeInferenceTerm(env: TypeEnvironment, term: Term) -> (Substitution, Type) {
        switch term {
        case let .variable(variable):
            if let scheme = env[variable] {
                return (Substitution(), scheme.instantiate())
            } else {
                fatalError()
            }
        case let .literal(literal):
            return typeInferenceLiteral(env: env, literal: literal)
        case let .abstraction(variable, term2):
            let tv = Type.typeVar(TypeVariable())
            let env2 = env.removing(variable: variable)
            let env3 = env2.union(other: TypeEnvironment([variable: TypeScheme(variables: [], type: tv)]))
            let (s1, t1) = typeInferenceTerm(env: env3, term: term2)
            return (s1, .function(tv.apply(s1), t1))
        case let .application(termL, termR):
            let tv = Type.typeVar(TypeVariable())
            let (s1, t1) = typeInferenceTerm(env: env, term: termL)
            let (s2, t2) = typeInferenceTerm(env: env.apply(s1), term: termR)
            let s3 = Unification.mgu(t1.apply(s2), .function(t2, tv))
            return (s3.compose(other: s2).compose(other: s1), tv.apply(s3))
        case let .let(variable, termBind, termBody):
            let (s1, t1) = typeInferenceTerm(env: env, term: termBind)
            let env2 = env.removing(variable: variable)
            let td = t1.generalize(env)
            let env3 = env2.inserting(variable: variable, scheme: td)
            let (s2, t2) = typeInferenceTerm(env: env3.apply(s1), term: termBody)
            return (s1.compose(other: s2), t2)
        }
    }

    static func typeInference(env: TypeEnvironment, term: Term) -> Type {
        let (s, t) = typeInferenceTerm(env: env, term: term)
        return t.apply(s)
    }
}
