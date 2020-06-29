//
//  TabBarFactory.swift
//  MVVM-Covid19App
//
//  Created by Iury Popov on 18.06.2020.
//  Copyright © 2020 Iurii Popov. All rights reserved.
//

import UIKit

class TabBarFactory {
    
    private let factory: ScreenFactory
    
    init(factory: ScreenFactory) {
        self.factory = factory
    }
    
    func makeTabBarViewController() -> UITabBarController {
        let tabBar = UITabBarController()
        tabBar.viewControllers = [
            UINavigationController(rootViewController: factory.makeInfoViewController()),
            factory.makeMapViewController(),
            factory.makeNewsViewController()
        ]
        return tabBar
    }
}
