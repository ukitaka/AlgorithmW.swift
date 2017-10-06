//
//  Created by ukitaka on 2017/10/06.
//

struct TypeVariable {
    let name: String
    
    init(_ name: String) {
        self.name = name
    }
}

extension TypeVariable: Equatable {
    static func ==(lhs: TypeVariable, rhs: TypeVariable) -> Bool {
        return lhs.name == rhs.name
    }
}

extension TypeVariable: Hashable {
    var hashValue: Int {
        return name.hashValue
    }
}
