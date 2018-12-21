//
//  Reduce.swift
//  iOSmeetup
//
//  Created by bbb on 12/4/18.
//  Copyright © 2018 bbb. All rights reserved.
//

import Foundation

extension Array {
    //o(n)
    mutating func popFirst() -> Element? {
        guard let first = self.first else { return nil }
        self.removeFirst()
        return first
    }
}

func reduce<A, B>(f: (A, B) -> B, arr: [A], acc: B) -> B {
    var arr = arr
    
    guard let first = arr.popFirst() else { return acc }
    return reduce(f: f, arr: arr, acc: f(first, acc))
}

func map<A, B>(f: (A) -> B, arr: [A]) -> [B] {
    return reduce(f: { element, acc in
        var acc = acc
        acc.append(f(element))
        return acc
    }, arr: arr, acc: [])
}

func filter<A>(f: (A) -> Bool, arr: [A]) -> [A] {
    return reduce(f: { element, acc in
        var acc = acc
        f(element) ? acc.append(element) : ()
        return acc
    }, arr: arr, acc: [])
}

// correct reduce
extension Sequence {
    func foldl<A>(into initial: A, _ combine: (inout A, Iterator.Element) -> ()) -> A {
        var result = initial
        for element in self {
            combine(&result, element)
        }
        return result
    }
}
