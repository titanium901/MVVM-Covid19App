//
//  Coordinator.swift
//  MVVM-Covid19App
//
//  Created by Iury Popov on 17.06.2020.
//  Copyright © 2020 Iurii Popov. All rights reserved.
//

import UIKit

protocol InfoViewCoordinatorProtocol {
  func presentDetailInfoViewController(with: Country)
}

class InfoViewCoordinator: InfoViewCoordinatorProtocol {
    
    private let presenter: UINavigationController
    private let factory: ViewControllerFactory
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
        self.factory = ViewControllerFactory()
    }
    
    func presentDetailInfoViewController(with country: Country) {
        let detailsInfoViewController = factory.makeDetailsInoViewController(with: country)
        presenter.present(detailsInfoViewController, animated: true)
    }
}

