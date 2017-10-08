//
//  Created by ukitaka on 2017/10/06.
//

struct TypeEnvironment {
    private let environment: [TypeVariable: TypeScheme]

    init() {
        self.environment = [:]
    }

    init(_ environment: [TypeVariable: TypeScheme]) {
        self.environment = environment
    }

    func inserting(variable: TypeVariable, scheme: TypeScheme) -> TypeEnvironment {
        var environment = self.environment
        environment[variable] = scheme
        return TypeEnvironment(environment)
    }

    func removing(variable: TypeVariable) -> TypeEnvironment {
        return TypeEnvironment(environment.removing(key: variable))
    }

    func union(other: TypeEnvironment) -> TypeEnvironment {
        let e = environment.merging(other.environment, uniquingKeysWith: { _, t in t })
        return TypeEnvironment(e)
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

extension TypeEnvironment: CustomStringConvertible {
    var description: String {
        return environment.description
    }
}
