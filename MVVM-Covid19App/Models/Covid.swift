//
//  Covid.swift
//  MVVM-Covid19App
//
//  Created by Iury Popov on 09.06.2020.
//  Copyright © 2020 Iurii Popov. All rights reserved.
//

import Foundation

struct Covid: Codable {
    let global: Global
    let countries: [Country]
    let date: String

    enum CodingKeys: String, CodingKey {
        case global = "Global"
        case countries = "Countries"
        case date = "Date"
    }
    
    func loadCovid(completion: @escaping (Covid?, Error?) -> Void) {
        NetworkManagerCovid.getCovidStatus() { result in
            switch result {
            case .success(let covid):
                completion(covid, nil)
            case.failure(let error):
                completion(nil, error)
            }
        }
    }
}
