//
//  NewsViewModel.swift
//  MVVM-Covid19App
//
//  Created by Iury Popov on 29.06.2020.
//  Copyright © 2020 Iurii Popov. All rights reserved.
//

import Foundation

class NewsViewModel {
    
    private var newsManager: NetworkManagerNews
    
    init(newsManager: NetworkManagerNews) {
        self.newsManager = newsManager
    }
    
    var news: [NewsElement] = []
    
    func viewDidLoad(completion: @escaping () -> Void) {
        newsManager.getNews { result in
            switch result {
            case .success(let news):
                self.news = news.news
                completion()
            case.failure(_):
                break
            }
        }
    }
}
