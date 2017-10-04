//
// Created by ukitaka on 2017/10/04.
//

import Foundation

public indirect enum Term {
    case Lambda(String, Term) // λx.t
    case Apply(Term, Term) // t t
}
