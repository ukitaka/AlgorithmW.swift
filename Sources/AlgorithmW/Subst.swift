//
// Created by ukitaka on 2017/10/04.
//

struct Subst {
    let map: [String: Type]

    init() {
        self.map = [:]
    }

    init(map: [String: Type]) {
        self.map = map
    }

    func compose(other: Subst) -> Subst {
        return Subst(map: self.map.merging(other.map, uniquingKeysWith: { _, t2 in t2 }))
    }
}
