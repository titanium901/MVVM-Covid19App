//
//  NewsScreenAssembly.swift
//  MVVM-Covid19App
//
//  Created by Iury Popov on 18.06.2020.
//  Copyright © 2020 Iurii Popov. All rights reserved.
//

import UIKit

enum NewsScreenAssembly {
    static func assembly(service: NetworkManagerNews) -> UIViewController {
        let viewModel = NewsViewModel(newsManager: service)
        let vc = NewsViewController(viewModel: viewModel)
        return vc
    }
}
