//
//  AppDelegate.swift
//  iOSmeetup
//
//  Created by bbb on 11/27/18.
//  Copyright © 2018 bbb. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let array = Array(1...10)
        let sum = reduce(f: +, arr: array, acc: 0)
        let strings = map(f: String.init, arr: array)
        return true
    }
}
