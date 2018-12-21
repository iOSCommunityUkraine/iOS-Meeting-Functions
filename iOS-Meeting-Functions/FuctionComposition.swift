//
//  Functions.swift
//  iOSmeetup
//
//  Created by bbb on 11/30/18.
//  Copyright © 2018 bbb. All rights reserved.
//

import Foundation

precedencegroup CompositionPrecedence {
    higherThan: ApplicationPrecedence
    associativity: left
}

infix operator •: CompositionPrecedence

func composition<A, B, C>(f: @escaping (A) -> B, g: @escaping (B) -> C) -> (A) -> C {
    return {
        return g(f($0))
    }
}

func •<A, B, C>(f: @escaping (A) -> B, g: @escaping (B) -> C) -> (A) -> C {
    return composition(f: f, g: g)
}
