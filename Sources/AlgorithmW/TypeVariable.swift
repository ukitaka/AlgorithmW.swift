//
//  Created by ukitaka on 2017/10/06.
//

struct TypeVariable {
    private static var counter: Int = 1

    let name: Name

    init(_ name: Name) {
        self.name = name
    }

    init() {
        self.name = "T\(TypeVariable.counter)"
        TypeVariable.counter += 1
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
