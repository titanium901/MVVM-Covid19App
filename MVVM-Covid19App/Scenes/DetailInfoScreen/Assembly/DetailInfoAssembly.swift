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
        let vc = DetailsInfoViewController(country: country)
        return vc
    }
}
