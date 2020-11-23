//
//  SceneDelegate.swift
//  AlineaInvest
//
//  Created by Mohan on 23/11/20.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let scene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: scene)
        
        let viewController = ExploreContainerViewController()
        let navController = UINavigationController(rootViewController: viewController)
        navController.navigationBar.isTranslucent = false
        window.rootViewController = navController
        
        window.makeKeyAndVisible()
        self.window = window
    }
}

