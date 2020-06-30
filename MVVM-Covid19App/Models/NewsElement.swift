//
//  NewsElement.swift
//  MVVM-Covid19App
//
//  Created by Iury Popov on 29.06.2020.
//  Copyright © 2020 Iurii Popov. All rights reserved.
//

struct NewsElement: Codable {
    let id, title, newsDescription: String
    let url: String
    let author: String
    let image: String
    let language: Language
    let category: [String]
    let published: String

    enum CodingKeys: String, CodingKey {
        case id, title
        case newsDescription = "description"
        case url, author, image, language, category, published
    }
}

