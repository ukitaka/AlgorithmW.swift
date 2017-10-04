//
// Created by ukitaka on 2017/10/04.
//

enum Type {
    case typeVar(String)
    case int
    case bool
}

extension Type: Equatable {
    static func ==(lhs: Type, rhs: Type) -> Bool {
        switch (lhs, rhs) {
        case let (.typeVar(lx), .typeVar(rx)):
            return lx == rx
        case (.int, .int):
            return true
        case (.bool, .bool):
            return true
        default:
            return false
        }
    }
}