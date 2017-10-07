//
// Created by ukitaka on 2017/10/04.
//

struct TypeScheme {
    let names: [Name]
    let type: Type
}

extension TypeScheme {
    func instantiate() -> Type {
        let freshTypeVariables = (0..<names.count).map { _ in TypeVariable() }.map(Type.typeVar)
        let subst = Substitution(Dictionary(keys: names, values: freshTypeVariables))
        return type.apply(subst)
    }
}

extension TypeScheme: Types {
    typealias T = TypeScheme

    var freeTypeVariables: Set<TypeVariable> {
        let variables = names.map { TypeVariable($0) }
        return type.freeTypeVariables.subtracting(Set(variables))
    }

    func apply(_ substitution: Substitution) -> TypeScheme {
        return TypeScheme(names: names, type: type.apply(substitution.removing(names: names)))
    }
}
