//
//  SceneDelegate.swift
//  Eoljuga
//
//  Created by SEUNGMIN OH on 2022/11/15.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var appCoordinator: AppCoordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        appStrat(windowScene)
    }

    func appStrat(_ windowScene: UIWindowScene) {
        let navigationController = UINavigationController()
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()

        appCoordinator = AppCoordinator(navigationController)
        appCoordinator?.start()
    }
}
