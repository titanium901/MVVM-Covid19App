//
//  CovidViewModel.swift
//  MVVM-Covid19App
//
//  Created by Iury Popov on 09.06.2020.
//  Copyright © 2020 Iurii Popov. All rights reserved.
//

import Foundation

// лучше объединять по модулю
protocol GlobalViewModelProtocol {
    init(covidRepository: CovidRepository)
    var updateViewData: ((GlobalInfoView.ViewState) ->())? { get set }
    func fetchGlobalInfo()
}

final class GlobalViewModel: GlobalViewModelProtocol {
    
    var updateViewData: ((GlobalInfoView.ViewState) -> ())?
    
    private let covidRepository: CovidRepository
    
    required init(covidRepository: CovidRepository) {
        self.covidRepository = covidRepository
    }
    
    func fetchGlobalInfo() {
        updateViewData?(.loading)
        
        covidRepository.loadCovidFromNetwork { [weak self] covid, error in
            self?.updateViewData?(.success(
                Covid(
                    global: covid?.global,
                    countries: nil,
                    date: covid?.date)
                )
            )
            print("SOS ViewModel \(String(describing: covid?.date ?? nil))")
        }
    }
}
