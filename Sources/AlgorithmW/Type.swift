//
// Created by ukitaka on 2017/10/04.
//

indirect enum Type {
    case typeVar(TypeVariable)
    case integer
    case boolean
    case function(Type, Type)
}

extension Type: Equatable {
    static func ==(lhs: Type, rhs: Type) -> Bool {
        switch (lhs, rhs) {
        case let (.typeVar(lx), .typeVar(rx)):
            return lx == rx
        case (.integer, .integer):
            return true
        case (.boolean, .boolean):
            return true
        case let (.function(argL, retL), .function(argR, retR)):
            return argL == argR && retL == retR
        default:
            return false
        }
    }
}

extension Type: Types {
    typealias T = Type

    var freeTypeVariables: Set<TypeVariable> {
        switch self {
        case let .typeVar(typeVar):
            return Set(arrayLiteral: typeVar)
        case .integer, .boolean:
            return Set()
        case let .function(arg, ret):
            return arg.freeTypeVariables.union(ret.freeTypeVariables)
        }
    }

    func apply(substitution: Substitution) -> Type {
        switch self {
        case let .typeVar(typeVar):
            return substitution.map[typeVar.name, default: self]
        case .integer, .boolean:
            return self
        case let .function(arg, ret):
            return .function(arg.apply(substitution: substitution), ret.apply(substitution: substitution))
        }
    }
}
