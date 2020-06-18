//
//  AppCoordinator.swift
//  MVVM-Covid19App
//
//  Created by Iury Popov on 18.06.2020.
//  Copyright © 2020 Iurii Popov. All rights reserved.
//
import UIKit

class AppCoordinator {
    
    private var window: UIWindow
    private let factory: RootViewFactory
    
    init(window: UIWindow, factory: RootViewFactory) {
        self.window = window
        self.factory = factory
    }
    
    func start() {
        let rootViewController = factory.makeRootViewController()
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }
}
