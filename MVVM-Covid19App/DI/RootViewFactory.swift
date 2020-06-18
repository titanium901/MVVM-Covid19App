//
//  RootViewFactory.swift
//  MVVM-Covid19App
//
//  Created by Iury Popov on 18.06.2020.
//  Copyright © 2020 Iurii Popov. All rights reserved.
//

import UIKit

class RootViewFactory {
    
    private let factory: TabBarFactory
    
    init(factory: TabBarFactory) {
        self.factory = factory
    }
    
    func makeRootViewController() -> UIViewController {
        RootViewController(mainTabBarController: factory.makeTabBarViewController())
    }
}
