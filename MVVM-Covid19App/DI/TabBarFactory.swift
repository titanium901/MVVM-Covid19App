//
//  TabBarFactory.swift
//  MVVM-Covid19App
//
//  Created by Iury Popov on 18.06.2020.
//  Copyright © 2020 Iurii Popov. All rights reserved.
//

import UIKit

class TabBarFactory {
    
    private let factory: ViewControllerFactory
    
    init(factory: ViewControllerFactory) {
        self.factory = factory
    }
    
    func makeTabBarViewController() -> UITabBarController {
        let tabBar = UITabBarController()
        tabBar.viewControllers = [
            factory.makeInfoViewController(),
            factory.makeMapViewController(),
            factory.makeNewsViewController()
        ]
        return tabBar
    }
}
