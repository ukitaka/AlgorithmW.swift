//
// Created by ukitaka on 2017/10/04.
//

indirect enum Type {
    case `var`(String)
    case int
    case bool
    case fun(Type, Type)
}

extension Type: Equatable {
    static func ==(lhs: Type, rhs: Type) -> Bool {
        switch (lhs, rhs) {
        case let (.var(lx), .var(rx)):
            return lx == rx
        case (.int, .int):
            return true
        case (.bool, .bool):
            return true
        case let (.fun(argl, retl), .fun(argr, retr)):
            return argl == argr && retl == retr
        default:
            return false
        }
    }
}

extension Type: Types {
    typealias T = Type

    func ftv() -> Set<String> {
        switch self {
        case let .var(name):
            return Set(arrayLiteral: name)
        case .int, .bool:
            return Set()
        case let .fun(arg, ret):
            return arg.ftv().union(ret.ftv())
        }
    }

    func apply(subst: Subst) -> Type {
        switch self {
        case let .var(name):
            return subst.map[name, default: self]
        case .int, .bool:
            return self
        case let .fun(arg, ret):
            return .fun(arg.apply(subst: subst), ret.apply(subst: subst))
        }
    }
}
