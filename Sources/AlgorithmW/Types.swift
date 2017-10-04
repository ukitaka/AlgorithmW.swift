//
// Created by ukitaka on 2017/10/04.
//

protocol Types {
    associatedtype T
    func ftv() -> Set<String>
    func apply(subst: Subst, type: T) -> T
}
