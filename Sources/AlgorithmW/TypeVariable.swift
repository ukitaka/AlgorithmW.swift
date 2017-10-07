//
//  Created by ukitaka on 2017/10/06.
//

struct TypeVariable {
    let name: Name
    
    init(_ name: Name) {
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

extension TypeVariable: ExpressibleByStringLiteral {
    init(stringLiteral value: StringLiteralType) {
        self.name = value
    }

    init(unicodeScalarLiteral value: ExtendedGraphemeClusterLiteralType) {
        self.name = value
    }
}
