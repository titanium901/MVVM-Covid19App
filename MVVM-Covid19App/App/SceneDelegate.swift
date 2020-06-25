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
    var viewControllerFactory: ViewControllerFactory!
    var appCoordinator: AppCoordinator!

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene

        // можно инкапсулировать
//        struct AppFactory {
//            private let dependencies: ServiceFactory
//            init(dependencies: ServiceFactory) {}
//
//            func makeAppCoordinator(window: UIWindow) -> AppCoordinator {
//                AppCoordinator(window: window, dependencies: dependencies)
//            }
//        }

        viewControllerFactory = ViewControllerFactory()
        tabBarFactory = TabBarFactory(factory: viewControllerFactory)
        rootFactory = RootViewFactory(factory: tabBarFactory)
        // зачем два раза?
        tabBarFactory = TabBarFactory(factory: viewControllerFactory)
        appCoordinator = AppCoordinator(window: window!, factory: rootFactory)
        appCoordinator.start()
    }
}
