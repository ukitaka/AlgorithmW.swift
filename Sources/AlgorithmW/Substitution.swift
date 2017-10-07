//
// Created by ukitaka on 2017/10/04.
//

struct Substitution {
    private let map: [Name: Type]

    init() {
        self.map = [:]
    }

    init(_ map: [String: Type]) {
        self.map = map
    }

    func compose(other: Substitution) -> Substitution {
        return Substitution(map.merging(other.map, uniquingKeysWith: { _, t in t }))
    }

    func removing(names: [Name]) -> Substitution {
        return Substitution(map.removing(keys: names))
    }

    subscript(name: Name) -> Type? {
        return map[name]
    }

}

