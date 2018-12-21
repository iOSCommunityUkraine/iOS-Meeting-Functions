//
//  FunctionApplications.swift
//  iOSmeetup
//
//  Created by bbb on 11/30/18.
//  Copyright © 2018 bbb. All rights reserved.
//

import Foundation

precedencegroup ApplicationPrecedence {
    higherThan: AssignmentPrecedence
    associativity: left
}

infix operator §: ApplicationPrecedence

func §<A, B>(f: (A) -> B, a: A) -> B {
    return f(a)
}

let str = String.init § 10
let str1 = String(10)

