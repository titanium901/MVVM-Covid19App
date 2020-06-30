//
//  NewsViewCoordinator.swift
//  MVVM-Covid19App
//
//  Created by Iury Popov on 29.06.2020.
//  Copyright © 2020 Iurii Popov. All rights reserved.
//

import UIKit

protocol NewsViewCoordinatorProtocol {
  func presentSafariViewController(with: URL)
}

class NewsViewCoordinator: NewsViewCoordinatorProtocol {
    
    private let presenter: UINavigationController
    private let factory: ScreenFactory
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
        self.factory = ScreenFactory(serviceFactory: ServiceFactory())
    }
    
    func presentSafariViewController(with url: URL) {
        let svc = factory.makeSafariViewController(with: url)
        presenter.present(svc, animated: true)
    }
}
