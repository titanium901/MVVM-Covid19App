//
//  Global.swift
//  MVVM-Covid19App
//
//  Created by Iury Popov on 09.06.2020.
//  Copyright © 2020 Iurii Popov. All rights reserved.
//

struct Global: Codable {
    // так лучше не делать
    let newConfirmed, totalConfirmed, newDeaths, totalDeaths: Int
    let newRecovered, totalRecovered: Int

    enum CodingKeys: String, CodingKey {
        case newConfirmed = "NewConfirmed"
        case totalConfirmed = "TotalConfirmed"
        case newDeaths = "NewDeaths"
        case totalDeaths = "TotalDeaths"
        case newRecovered = "NewRecovered"
        case totalRecovered = "TotalRecovered"
    }
}
