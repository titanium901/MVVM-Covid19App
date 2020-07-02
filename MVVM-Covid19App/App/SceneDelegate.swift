//
//  SceneDelegate.swift
//  MVVM-Covid19App
//
//  Created by Iury Popov on 08.06.2020.
//  Copyright © 2020 Iurii Popov. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var rootFactory: RootViewFactory!
    var tabBarFactory: TabBarFactory!
    var screenFactory: ScreenFactory!
    var appCoordinator: AppCoordinator!
    var appFactory: AppFactory!

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene

        screenFactory = ScreenFactory(serviceFactory: ServiceFactory())
        tabBarFactory = TabBarFactory(factory: screenFactory)
        rootFactory = RootViewFactory(factory: tabBarFactory)
        appFactory = AppFactory(factory: rootFactory)
        appCoordinator = appFactory.makeAppCoordinator(window: window!)
        appCoordinator.start()
    }
}
