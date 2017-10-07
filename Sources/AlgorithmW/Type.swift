//
// Created by ukitaka on 2017/10/04.
//

indirect enum Type {
    case typeVar(TypeVariable)
    case integer
    case boolean
    case function(Type, Type)
}

extension Type {
    init(_ variableName: String) {
        self = .typeVar(TypeVariable(variableName))
    }

    func generalize(_ typeEnv: TypeEnvironment) -> TypeScheme {
        let names = freeTypeVariables.subtracting(typeEnv.freeTypeVariables).map { $0.name }
        return TypeScheme(names: names, type: self)
    }
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

extension Type: Hashable {
    var hashValue: Int {
        return description.hashValue
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

    func apply(_ substitution: Substitution) -> Type {
        switch self {
        case let .typeVar(typeVar):
            return substitution[typeVar.name] ?? self
        case .integer, .boolean:
            return self
        case let .function(arg, ret):
            return .function(arg.apply(substitution), ret.apply(substitution))
        }
    }
}

extension Type: CustomStringConvertible {
    var description: String {
        switch self {
        case let .typeVar(variable):
            return variable.name
        case .integer:
            return "Int"
        case .boolean:
            return "Bool"
        case let .function(arg, ret):
            return "\(arg) -> \(ret)"
        }
    }
}
