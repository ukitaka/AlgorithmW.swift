//
// Created by ukitaka on 2017/10/07.
//

extension Dictionary {
    func removing(key: Key) -> Dictionary<Key, Value> {
        var dictionary = self
        dictionary.removeValue(forKey: key)
        return dictionary
    }

    func removing(keys: [Key]) -> Dictionary<Key, Value> {
        var dictionary = self
        for key in keys {
            dictionary.removeValue(forKey: key)
        }
        return dictionary
    }
}

extension Array where Element: Sequence {
    public func flatten() -> Array<Element.Element> {
        return flatMap { $0 }
    }
}
