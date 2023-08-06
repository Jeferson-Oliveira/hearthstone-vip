//
//  AppDelegate.swift
//  JefersonHearthstone
//
//  Created by Jeferson de Jesus on 05/08/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        startCardsScene()
        return true
    }
    
    private func startCardsScene() {
        let navController = UINavigationController()
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
        navController.pushViewController(SceneFactory.buildListCardScene(on: navController), animated: true)
    }

}

