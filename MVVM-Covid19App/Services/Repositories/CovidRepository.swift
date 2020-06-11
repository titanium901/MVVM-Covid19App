//
//  CovidRepository.swift
//  MVVM-Covid19App
//
//  Created by Iury Popov on 09.06.2020.
//  Copyright © 2020 Iurii Popov. All rights reserved.
//

// зачем нужен?
class CovidRepository {
    
    let networkManager: NetworkManagerCovid!
    // database
    
    init(networkManager: NetworkManagerCovid) {
        self.networkManager = networkManager
    }

    // вроде одинаковый интерфейс с NetworkManagerCovid
    // protocol LoadCovidInfo {}
    func loadCovidFromNetwork(completion: @escaping (Covid?, Error?) -> Void) {
        networkManager.getCovidStatus() { result in
            switch result {
            case .success(let covid):
                completion(covid, nil)
            case.failure(let error):
                completion(nil, error)
            }
        }
    }
}
