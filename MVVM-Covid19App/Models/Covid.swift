//
//  Covid.swift
//  MVVM-Covid19App
//
//  Created by Iury Popov on 09.06.2020.
//  Copyright © 2020 Iurii Popov. All rights reserved.
//

enum CovidViewData {
    case initial
    case loading
    case success(Covid)
    case failure
    
    struct Covid: Codable {
        let global: Global?
        let countries: [Country]?
        let date: String?

        enum CodingKeys: String, CodingKey {
            case global = "Global"
            case countries = "Countries"
            case date = "Date"
        }
    }
}
