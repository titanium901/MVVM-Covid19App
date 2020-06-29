//
//  CovidViewModel.swift
//  MVVM-Covid19App
//
//  Created by Iury Popov on 10.06.2020.
//  Copyright © 2020 Iurii Popov. All rights reserved.
//

import Foundation

protocol CovidViewModelProtocol {
    init(covidRepository: CovidRepository)
    var countries: [Country] { get }
    var error: Error? { get }
    func showCountriesInfo(completion: @escaping () -> Void)
    func viewDidLoad()
    var updateViewData: ((GlobalInfoView.ViewState) ->())? { get set }
}

// CovidViewModelImp: CovidViewModel
final class CovidViewModel: CovidViewModelProtocol {
    
    private let covidRepository: CovidRepository
    var updateViewData: ((GlobalInfoView.ViewState) -> ())?

    // по умолчанию internal
    var countries: [Country] = []
    // как используешь?
    var error: Error?
    
    init(covidRepository: CovidRepository) {
        self.covidRepository = covidRepository
    }
    
    func viewDidLoad() {
        updateViewData?(.loading)
        
        covidRepository.loadCovidFromNetwork { [weak self] covid, error in
            self?.updateViewData?(.success(
                Covid(
                    global: covid?.global,
                    countries: nil,
                    date: covid?.date)
                )
            )
            print("SOS showGlobalInfo \(String(describing: covid?.date ?? nil))")
        }
    }
    
    func showCountriesInfo(completion: @escaping () -> Void) {
        covidRepository.loadCovidFromNetwork { [weak self] covid, error in
            self?.countries = covid?.countries ?? []
            self?.error = error
            completion()
            print("SOS showCountriesInfo \(String(describing: covid?.countries?.count ?? nil))")
        }
    }
}
