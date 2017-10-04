//
// Created by ukitaka on 2017/10/04.
//

indirect enum Expr {
    case `var`(String)
    case lit(Lit)
    case app(Expr, Expr)
    case abs(String, Expr)
    case `let`(String, Expr, Expr)
}
