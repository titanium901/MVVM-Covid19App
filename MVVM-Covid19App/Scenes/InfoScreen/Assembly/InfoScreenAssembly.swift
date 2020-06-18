//
//  InfoScreenAssembly.swift
//  MVVM-Covid19App
//
//  Created by Sukhanov Evgeniy on 11.06.2020.
//  Copyright © 2020 Iurii Popov. All rights reserved.
//

import UIKit

enum InfoScreenAssembly {
    static func assembly(service: ServiceFactory) -> UIViewController {
        let viewModel = CovidViewModel(covidRepository: service.covidRepository)
        let vc = InfoViewController(viewModel: viewModel)
        return UINavigationController(rootViewController: vc)
    }
}
