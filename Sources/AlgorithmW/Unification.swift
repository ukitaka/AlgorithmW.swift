//
// Created by Yuki Takahashi on 2017/10/07.
//

struct Unification {
    static func varBind(variable: TypeVariable, type: Type) -> Substitution {
        if Type.typeVar(variable) == type {
            return Substitution()
        }
        if type.freeTypeVariables.contains(variable) {
            fatalError("")
        }
        return Substitution([variable:type])
    }

    static func mostGeneralUnifier(_ type1: Type, _ type2: Type) -> Substitution {
        switch (type1, type2) {
        case let (.function(arg1, ret1), .function(arg2, ret2)):
            let s1 = mostGeneralUnifier(arg1, arg2)
            let s2 = mostGeneralUnifier(ret1.apply(s1), ret2.apply(s1))
            return s1.compose(other: s2)

        case let (.typeVar(variable), _):
            return varBind(variable: variable, type: type2)
        case let (_, .typeVar(variable)):
            return varBind(variable: variable, type: type1)
        case (.integer, .integer):
            return Substitution()
        case (.boolean, .boolean):
            return Substitution()
        default:
            fatalError("fails")
        }
    }
}
