//
// Created by ukitaka on 2017/10/04.
//

indirect enum Term {
    case variable(Name)
    case literal(Literal)
    case application(Term, Term)
    case abstraction(Name, Term)
    case `let`(Name, Term, Term)
}
