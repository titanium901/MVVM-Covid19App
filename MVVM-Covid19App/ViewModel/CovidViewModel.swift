//
//  CovidViewModel.swift
//  MVVM-Covid19App
//
//  Created by Iury Popov on 09.06.2020.
//  Copyright © 2020 Iurii Popov. All rights reserved.
//

import Foundation

final class CovidViewModel: CovidViewModelProtocol {
    
    var updateViewData: ((CovidViewData) -> ())?
    
    private let covidRepository: CovidRepository
    
    required init(covidRepository: CovidRepository) {
        self.covidRepository = covidRepository

    }
    
    public func showGlobalInfo() {
        updateViewData?(.loading)
        
        covidRepository.loadCovidFromNetwork { [weak self] covid, error in
            self?.updateViewData?(.success(
                CovidViewData.Covid(
                    global: covid?.global,
                    countries: nil,
                    date: nil)
                )
            )
            print("SOS ViewModel \(String(describing: covid?.global ?? nil))")
        }
    }
    
    public func showAllCountryInfo() {
        
    }
    
}
