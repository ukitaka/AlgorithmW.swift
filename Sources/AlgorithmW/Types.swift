//
// Created by ukitaka on 2017/10/04.
//

protocol Types {
    associatedtype T
    var freeTypeVariables: Set<TypeVariable> { get }
    func apply(subst: Subst) -> T
}
