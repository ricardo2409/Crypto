//
//  AppDelegate.swift
//  App
//
//  Created by Ricardo Trevino on 6/29/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds) //phone size
        
        let viewcontroller = UIViewController()
        window?.rootViewController = viewcontroller
        window?.makeKeyAndVisible()
        
        return true
    }


}

