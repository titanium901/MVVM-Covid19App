//
//  AppFactory.swift
//  MVVM-Covid19App
//
//  Created by Iury Popov on 29.06.2020.
//  Copyright © 2020 Iurii Popov. All rights reserved.
//

import UIKit

struct AppFactory {
    private let factory: RootViewFactory
    init(factory: RootViewFactory) {
        self.factory = factory
    }

    func makeAppCoordinator(window: UIWindow) -> AppCoordinator {
        AppCoordinator(window: window, factory: factory)
    }
}
