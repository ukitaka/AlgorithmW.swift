//
// Created by ukitaka on 2017/10/04.
//

indirect enum Term {
    case variable(String)
    case literal(Literal)
    case application(Term, Term)
    case abstraction(String, Term)
    case `let`(String, Term, Term)
}
