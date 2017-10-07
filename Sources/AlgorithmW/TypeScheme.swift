//
// Created by ukitaka on 2017/10/04.
//

struct TypeScheme {
    let names: [Name]
    let type: Type
}

extension TypeScheme: Types {
    typealias T = TypeScheme

    var freeTypeVariables: Set<TypeVariable> {
        let variables = names.map { TypeVariable($0) }
        return type.freeTypeVariables.subtracting(Set(variables))
    }

    func apply(substitution: Substitution) -> TypeScheme {
        fatalError("not")
    }
}
