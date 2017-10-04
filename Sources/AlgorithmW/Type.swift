//
// Created by ukitaka on 2017/10/04.
//

indirect enum Type {
    case `var`(String)
    case int
    case bool
    case fun(Type, Type)
}

extension Type: Equatable {
    static func ==(lhs: Type, rhs: Type) -> Bool {
        switch (lhs, rhs) {
        case let (.var(lx), .var(rx)):
            return lx == rx
        case (.int, .int):
            return true
        case (.bool, .bool):
            return true
        case let (.fun(argl, retl), .fun(argr, retr)):
            return argl == argr && retl == retr
        default:
            return false
        }
    }
}