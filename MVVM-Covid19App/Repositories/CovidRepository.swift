//
//  CovidRepository.swift
//  MVVM-Covid19App
//
//  Created by Iury Popov on 09.06.2020.
//  Copyright © 2020 Iurii Popov. All rights reserved.
//

class CovidRepository {
    
    let networkManager: NetworkManagerCovid!
    
    init(networkManager: NetworkManagerCovid) {
        self.networkManager = networkManager
    }
    
    func loadCovidFromNetwork(completion: @escaping (CovidViewData.Covid?, Error?) -> Void) {
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
