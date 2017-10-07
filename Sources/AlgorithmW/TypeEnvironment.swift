//
//  Created by ukitaka on 2017/10/06.
//

struct TypeEnvironment {
    private let environment: [TypeVariable: TypeScheme]

    init(_ environment: [TypeVariable: TypeScheme]) {
        self.environment = environment
    }

    func removing(variable: TypeVariable) -> TypeEnvironment {
        return TypeEnvironment(environment.removing(key: variable))
    }

    subscript(variable: TypeVariable) -> TypeScheme? {
        return environment[variable]
    }
}

extension TypeEnvironment: Types {
    typealias T = TypeEnvironment

    var freeTypeVariables: Set<TypeVariable> {
        return Set(environment.values.map { $0.freeTypeVariables }.flatten())
    }

    func apply(_ substitution: Substitution) -> TypeEnvironment {
        return TypeEnvironment(environment.mapValues({ typeScheme in typeScheme.apply(substitution) }))
    }
}
