//
// Created by ukitaka on 2017/10/04.
//

struct TypeScheme {
    let variables: [TypeVariable]
    let type: Type
}

extension TypeScheme {
    func instantiate() -> Type {
        let freshTypeVariables = (0..<variables.count).map { _ in TypeVariable() }.map(Type.typeVar)
        let subst = Substitution(Dictionary(keys: variables, values: freshTypeVariables))
        return type.apply(subst)
    }
}

extension TypeScheme: Types {
    typealias T = TypeScheme

    var freeTypeVariables: Set<TypeVariable> {
        return type.freeTypeVariables.subtracting(Set(variables))
    }

    func apply(_ substitution: Substitution) -> TypeScheme {
        return TypeScheme(variables: variables, type: type.apply(substitution.removing(variables: variables)))
    }
}

extension TypeScheme: CustomStringConvertible {
    var description: String {
        return variables.map { "∀ " + $0.name }.joined(separator: " ") + " . " + type.description
    }
}
