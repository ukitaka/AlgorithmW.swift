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
        case let (.function(argl, retl), .function(argr, retr)):
            return argl == argr && retl == retr
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

    func apply(subst: Subst) -> Type {
        switch self {
        case let .typeVar(typeVar):
            return subst.map[typeVar.name, default: self]
        case .integer, .boolean:
            return self
        case let .function(arg, ret):
            return .function(arg.apply(subst: subst), ret.apply(subst: subst))
        }
    }
}
