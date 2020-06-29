//
//  InfoScreenAssembly.swift
//  MVVM-Covid19App
//
//  Created by Sukhanov Evgeniy on 11.06.2020.
//  Copyright © 2020 Iurii Popov. All rights reserved.
//

import UIKit

enum InfoScreenAssembly {
    // Зачем отдавать всю фабрику со всеми всеми зависимостями?
    // 
    static func assembly(service: ServiceFactory) -> UIViewController {
        let viewModel = CovidViewModel(covidRepository: service.covidRepository)
        let vc = InfoViewController(viewModel: viewModel)
        // модуль может возвращать только контроллер без навигейшена
        // зачем ограничивать применение модуля?
        return vc
    }
}
