//
// Created by ukitaka on 2017/10/04.
//

struct Substitution {
    private let map: [TypeVariable: Type]

    init() {
        self.map = [:]
    }

    init(_ map: [TypeVariable: Type]) {
        self.map = map
    }

    func compose(other: Substitution) -> Substitution {
        return Substitution(map.merging(other.map, uniquingKeysWith: { _, t in t }))
    }

    func removing(variables: [TypeVariable]) -> Substitution {
        return Substitution(map.removing(keys: variables))
    }

    subscript(variable: TypeVariable) -> Type? {
        return map[variable]
    }

}

