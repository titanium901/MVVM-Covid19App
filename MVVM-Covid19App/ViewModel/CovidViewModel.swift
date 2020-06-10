//
//  CovidViewModel.swift
//  MVVM-Covid19App
//
//  Created by Iury Popov on 09.06.2020.
//  Copyright © 2020 Iurii Popov. All rights reserved.
//

import Foundation

class CovidViewModel: CovidViewModelProtocol {
    
    let covidRepository: CovidRepository
    
    required init(covidRepository: CovidRepository) {
        self.covidRepository = covidRepository
    }
    
    func showGlobalInfo() {
        covidRepository.loadCovidFromNetwork { covid, error in
            print("SOS ViewModel \(covid?.global)")
        }
    }
    
    func showAllCountryInfo() {
        
    }
    
}
