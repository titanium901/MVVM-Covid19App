//
//  ViewControllerFactory.swift
//  MVVM-Covid19App
//
//  Created by Iury Popov on 08.06.2020.
//  Copyright © 2020 Iurii Popov. All rights reserved.
//

import UIKit

//class ServiceFactory {
//    private let networkManager: NetworkManagerCovid
//    private let covidRepository: CovidRepository
//}

class ViewControllerFactory {
    
    private let networkManager: NetworkManagerCovid
    private let covidRepository: CovidRepository
    private let globalViewModal: GlobalViewModel
    private let countryViewModel: CountryViewModel
    private let viewModel: CovidViewModel
    
    init() {
        self.networkManager = NetworkManagerCovid()
        self.covidRepository = CovidRepository(networkManager: networkManager)
        self.globalViewModal = GlobalViewModel(covidRepository: covidRepository)
        self.countryViewModel = CountryViewModel(covidRepository: covidRepository)
        self.viewModel = CovidViewModel(globalViewModal: globalViewModal, countryViewModel: countryViewModel)
    }
    
    func makeRootViewController() -> UIViewController {
        RootViewController(mainTabBarController: makeTabBarViewController())
    }
    
    private func makeTabBarViewController() -> UITabBarController {
        let tabBar = UITabBarController()
        tabBar.viewControllers = [
            makeInfoViewController(),
            makeMapViewController(),
            makeNewsViewController()
        ]
        return tabBar
    }
    
    private func makeInfoViewController() -> UIViewController {
//        let invoVC = InfoScreenAssembly(service: service)
        let infoVC = InfoViewController(viewModel: viewModel)
        infoVC.tabBarItem = UITabBarItem(
            title: "Info",
            image: UIImage(named: "infoIcon")?.withRenderingMode(.alwaysOriginal),
            selectedImage: UIImage(named: "infoIcon")?.withRenderingMode(.alwaysOriginal)
        )
        return infoVC
    }
    
    private func makeMapViewController() -> UIViewController {
        let mapVC = MapViewController()
        mapVC.tabBarItem = UITabBarItem(
            title: "Map",
            image: UIImage(named: "mapIcon")?.withRenderingMode(.alwaysOriginal),
            selectedImage: UIImage(named: "mapIcon")?.withRenderingMode(.alwaysOriginal)
        )
        return mapVC
    }

    private func makeNewsViewController() -> UIViewController {
        let newsVC = NewsViewController()
        newsVC.tabBarItem = UITabBarItem(
            title: "News",
            image: UIImage(named: "newsIcon")?.withRenderingMode(.alwaysOriginal),
            selectedImage: UIImage(named: "newsIcon")?.withRenderingMode(.alwaysOriginal)
        )
        return newsVC
    }
}
