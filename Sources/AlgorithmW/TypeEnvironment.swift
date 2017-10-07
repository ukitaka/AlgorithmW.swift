//
//  Created by ukitaka on 2017/10/06.
//

struct TypeEnvironment {
    private let environment: [Name: TypeScheme]

    init(_ environment: [Name: TypeScheme]) {
        self.environment = environment
    }

    func removing(name: String) -> TypeEnvironment {
        return TypeEnvironment(environment.removing(key: name))
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
