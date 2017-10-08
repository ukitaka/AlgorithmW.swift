//
// Created by ukitaka on 2017/10/04.
//

indirect enum Term {
    case variable(TypeVariable)
    case literal(Literal)
    case application(Term, Term)
    case abstraction(TypeVariable, Term)
    case `let`(TypeVariable, Term, Term)
}

extension Term: CustomStringConvertible {
    var description: String {
        switch self {
        case let .variable(v):
            return v.name
        case let .literal(.integer(i)):
            return "\(i)"
        case let .literal(.boolean(b)):
            return "\(b)"
        case let .application(term1, term2):
             return "(\(term1) \(term2))"
        case let .abstraction(variable, term):
            return "λ \(variable).\(term)"
        case let .let(variable, bind, body):
            return "let \(variable) = \(bind) in \(body)"
        }
    }
}