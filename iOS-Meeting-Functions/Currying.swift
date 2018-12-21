//
//  Currying.swift
//  iOSmeetup
//
//  Created by bbb on 12/4/18.
//  Copyright © 2018 bbb. All rights reserved.
//

import Foundation


func add<T: Numeric>(a: T, b: T) -> T {
    return a + b
}

func add<T: Numeric>(_ a: T) -> (T) -> T {
    return {
        return a + $0
    }
}

let increment = add(1)

postfix func ++(_ a: Int) -> Int {
    let a = increment(a)
    return a - 1
}

prefix func ++(_ a: Int) -> Int {
    let a = increment(a)
    return a
}


