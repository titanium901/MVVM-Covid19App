//
//  CovidViewModel.swift
//  MVVM-Covid19App
//
//  Created by Iury Popov on 09.06.2020.
//  Copyright © 2020 Iurii Popov. All rights reserved.
//

import Foundation

protocol GlobalViewModelProtocol {
    init(covidRepository: CovidRepository)
    var updateViewData: ((CovidViewData) ->())? { get set }
    func fetchGlobalInfo()
}

final class GlobalViewModel: GlobalViewModelProtocol {
    
    var updateViewData: ((CovidViewData) -> ())?
    
    private let covidRepository: CovidRepository
    
    required init(covidRepository: CovidRepository) {
        self.covidRepository = covidRepository
    }
    
    func fetchGlobalInfo() {
        updateViewData?(.loading)
        
        covidRepository.loadCovidFromNetwork { [weak self] covid, error in
            self?.updateViewData?(.success(
                CovidViewData.Covid(
                    global: covid?.global,
                    countries: nil,
                    date: covid?.date)
                )
            )
            print("SOS ViewModel \(String(describing: covid?.date ?? nil))")
        }
    }
}
