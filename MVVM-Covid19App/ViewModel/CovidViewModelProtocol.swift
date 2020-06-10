//
//  CovidViewModelProtocol.swift
//  MVVM-Covid19App
//
//  Created by Iury Popov on 09.06.2020.
//  Copyright © 2020 Iurii Popov. All rights reserved.
//

import Foundation

protocol CovidViewModelProtocol {
    init(covidRepository: CovidRepository)
    var updateViewData: ((CovidViewData) ->())? { get set }
    func showGlobalInfo()
    func showAllCountryInfo()
}
