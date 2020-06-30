//
//  News.swift
//  MVVM-Covid19App
//
//  Created by Iury Popov on 29.06.2020.
//  Copyright © 2020 Iurii Popov. All rights reserved.
//

// MARK: - News
struct News: Codable {
    let status: String
    let news: [NewsElement]
    let page: Int
}

enum Language: String, Codable {
    case en = "en"
}
