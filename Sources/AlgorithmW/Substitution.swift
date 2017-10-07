//
// Created by ukitaka on 2017/10/04.
//

struct Substitution {
    let map: [Name: Type]

    init() {
        self.map = [:]
    }

    init(_ map: [String: Type]) {
        self.map = map
    }

    func compose(other: Substitution) -> Substitution {
        return Substitution(map.merging(other.map, uniquingKeysWith: { _, t in t }))
    }
}
