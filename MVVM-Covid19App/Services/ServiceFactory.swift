//
//  ServiceFactory.swift
//  MVVM-Covid19App
//
//  Created by Iury Popov on 16.06.2020.
//  Copyright © 2020 Iurii Popov. All rights reserved.
//

// Можно в DI перенести

// Проектирование на интерфейсах а не на реализации
//protocol ServiceFactory {}
//class ServiceFactoryProd: ServiceFactory {}
//class ServiceFactoryMock: ServiceFactory {}
class ServiceFactory {
    let networkManager = NetworkManagerCovid()
    let covidRepository: CovidRepository
    let newsNetworkManager = NetworkManagerNews()
    
    init() {
        self.covidRepository = CovidRepository(networkManager: networkManager)
    }
}
