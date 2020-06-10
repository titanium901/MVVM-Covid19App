//
//  CovidViewModel.swift
//  MVVM-Covid19App
//
//  Created by Iury Popov on 10.06.2020.
//  Copyright © 2020 Iurii Popov. All rights reserved.
//

import Foundation

protocol CovidViewModelProtocol {
    init(globalViewModal: GlobalViewModel, countryViewModel: CountryViewModel)
    var countries: [Country] { get }
    var error: Error? { get }
    func showCountriesInfo(completion: @escaping () -> Void)
}

final class CovidViewModel {
    
    var countries: [Country] = []
    var error: Error?
    
    var globalViewModal: GlobalViewModelProtocol
    var countryViewModel: CountryViewModel
    
    init(globalViewModal: GlobalViewModel, countryViewModel: CountryViewModel) {
        self.globalViewModal = globalViewModal
        self.countryViewModel = countryViewModel
    }
    
    func showGlobalInfo() {
        globalViewModal.fetchGlobalInfo()
    }
    
    func showCountriesInfo(completion: @escaping () -> Void) {
        countryViewModel.fetchCountriesInfo { [weak self] countries, error in
            self?.countries = countries
            self?.error = error
            completion()
        }
    }
}
