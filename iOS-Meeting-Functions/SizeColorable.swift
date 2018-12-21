//
//  File.swift
//  iOSmeetup
//
//  Created by bbb on 11/28/18.
//  Copyright © 2018 bbb. All rights reserved.
//

import UIKit

protocol Colorable {
    var color: UIColor { get }
}

protocol Sizeable {
    var size: CGSize { get }
}

typealias SizeColorable = Sizeable & Colorable

final class FilterManager {
    private init() {}
    static let shared = FilterManager()
    
//    func filter<T: SizeColorable>(arr: [T], color: UIColor?, size: CGSize?) -> [T] {
//        return arr.filter { $0.color == color ?? $0.color && size == size ?? $0.size }
//    }
    
    func filterByColor(color: UIColor) -> ([SizeColorable]) -> [SizeColorable] {
        return { arr in
            arr.filter { $0.color == color }
        }
    }
    
    func filterBySize(size: CGSize) -> ([SizeColorable]) -> [SizeColorable] {
        return { arr in
            arr.filter { $0.size == size }
        }
    }
}

let zeroSizeFilter = FilterManager.shared.filterBySize(size: .zero)
let redColorFilter = FilterManager.shared.filterByColor(color: .red)
let zeroRedFilter = zeroSizeFilter • redColorFilter

