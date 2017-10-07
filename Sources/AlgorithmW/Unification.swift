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
}
