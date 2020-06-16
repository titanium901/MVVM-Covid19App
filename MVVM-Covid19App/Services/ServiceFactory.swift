//
//  ServiceFactory.swift
//  MVVM-Covid19App
//
//  Created by Iury Popov on 16.06.2020.
//  Copyright © 2020 Iurii Popov. All rights reserved.
//

class ServiceFactory {
    let networkManager: NetworkManagerCovid
    let covidRepository: CovidRepository
    
    init() {
        self.networkManager = NetworkManagerCovid()
        self.covidRepository = CovidRepository(networkManager: networkManager)
    }
}
