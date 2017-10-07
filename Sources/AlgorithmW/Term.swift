//
// Created by ukitaka on 2017/10/04.
//

indirect enum Term {
    case variable(TypeVariable)
    case literal(Literal)
    case application(Term, Term)
    case abstraction(TypeVariable, Term)
    case `let`(TypeVariable, Term, Term)
}
