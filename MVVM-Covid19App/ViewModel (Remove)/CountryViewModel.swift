//
//  CountryViewModel.swift
//  MVVM-Covid19App
//
//  Created by Iury Popov on 10.06.2020.
//  Copyright © 2020 Iurii Popov. All rights reserved.
//

import Foundation

protocol CountryViewModelProtocol {
    init(covidRepository: CovidRepository)
    func fetchCountriesInfo(completion: @escaping ([Country], Error?) -> Void)
}

final class CountryViewModel: CountryViewModelProtocol {
    
    private let covidRepository: CovidRepository
    
    required init(covidRepository: CovidRepository) {
        self.covidRepository = covidRepository
    }
    
    func fetchCountriesInfo(completion: @escaping ([Country], Error?) -> Void) {
        covidRepository.loadCovidFromNetwork { covid, error in
            completion(covid?.countries ?? [], error)
            print("SOS ViewModelCountry \(String(describing: covid?.countries?.count ?? nil))")
        }
    }
}
