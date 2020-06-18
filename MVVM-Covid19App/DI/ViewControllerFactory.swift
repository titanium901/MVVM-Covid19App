//
//  ViewControllerFactory.swift
//  MVVM-Covid19App
//
//  Created by Iury Popov on 08.06.2020.
//  Copyright © 2020 Iurii Popov. All rights reserved.
//

import UIKit

class ViewControllerFactory {
    
    private let serviceFactory: ServiceFactory
    
    init() {
        self.serviceFactory = ServiceFactory()
    }
    
    func makeInfoViewController() -> UIViewController {
        let infoVC = InfoScreenAssembly.assembly(service: serviceFactory)
        infoVC.tabBarItem = UITabBarItem(
            title: "Info",
            image: UIImage(named: "infoIcon")?.withRenderingMode(.alwaysOriginal),
            selectedImage: UIImage(named: "infoIcon")?.withRenderingMode(.alwaysOriginal)
        )
        return infoVC
    }
    
    func makeMapViewController() -> UIViewController {
        let mapVC = MapScreenAssembly.assembly()
        mapVC.tabBarItem = UITabBarItem(
            title: "Map",
            image: UIImage(named: "mapIcon")?.withRenderingMode(.alwaysOriginal),
            selectedImage: UIImage(named: "mapIcon")?.withRenderingMode(.alwaysOriginal)
        )
        return mapVC
    }

    func makeNewsViewController() -> UIViewController {
        let newsVC = NewsScreenAssembly.assembly()
        newsVC.tabBarItem = UITabBarItem(
            title: "News",
            image: UIImage(named: "newsIcon")?.withRenderingMode(.alwaysOriginal),
            selectedImage: UIImage(named: "newsIcon")?.withRenderingMode(.alwaysOriginal)
        )
        return newsVC
    }
    
    func makeDetailsInoViewController(with country: Country) -> UIViewController {
        DetailInfoScreenAssembly.assembly(with: country)
    }
}
