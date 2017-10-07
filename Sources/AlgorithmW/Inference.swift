//
// Created by Yuki Takahashi on 2017/10/07.
//

struct Inference {
    func typeInferenceLiteral(literal: Literal) -> Type {
        switch literal {
        case .integer:
            return .integer
        case .boolean:
            return .boolean
        }
    }
}
