//
//  AppDelegate.swift
//  ApiumSocialLogin
//
//  Created by carloscarrera on 06/14/2018.
//  Copyright (c) 2018 carloscarrera. All rights reserved.
//

import UIKit
import ApiumSocialLogin

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        return FacebookSocialAuthentication .application(application, didFinishLaunchingWithOptions: launchOptions)
    }

}

