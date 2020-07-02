//
//  DetailInfoAssembly.swift
//  MVVM-Covid19App
//
//  Created by Iury Popov on 18.06.2020.
//  Copyright © 2020 Iurii Popov. All rights reserved.
//

import UIKit

enum DetailInfoScreenAssembly {
    static func assembly(with country: Country) -> UIViewController {
        // -> view model

        // со второго на первый экран вернуть результат
        let vc = DetailsInfoViewController(country: country)
        return vc
    }
}

// Country -> input
// output
