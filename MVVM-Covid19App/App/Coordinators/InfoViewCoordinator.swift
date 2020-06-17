//
//  Coordinator.swift
//  MVVM-Covid19App
//
//  Created by Iury Popov on 17.06.2020.
//  Copyright © 2020 Iurii Popov. All rights reserved.
//

import UIKit

protocol Coordinator {
  func presentDetailInfoViewController(with: Country)
}

class InfoViewCoordinator: Coordinator {
    
    private let presenter: UINavigationController
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
    }
    
    func presentDetailInfoViewController(with country: Country) {
        let detailsViewController = DetailsInfoViewController(country: country)
        presenter.present(detailsViewController, animated: true)
    }
}

