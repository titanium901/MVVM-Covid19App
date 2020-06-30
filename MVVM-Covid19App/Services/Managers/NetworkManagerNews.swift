//
//  NetworkManagerNews.swift
//  MVVM-Covid19App
//
//  Created by Iury Popov on 29.06.2020.
//  Copyright © 2020 Iurii Popov. All rights reserved.
//

import Alamofire

//curl https://api.currentsapi.services/v1/search?keywords=COVID19?
//-G -d language=en
//-d apiKey=F9Jwf89i6zzPvZj_uBLUJiTyJ_Abjnbuna0TTqsLlh1W8TWS

//https://api.currentsapi.services/v1/search?keywords=COVID19&apiKey=F9Jwf89i6zzPvZj_uBLUJiTyJ_Abjnbuna0TTqsLlh1W8TWS


struct NetworkManagerNews {
    
    private let url = "https://api.currentsapi.services/v1/search?keywords=COVID19&apiKey=F9Jwf89i6zzPvZj_uBLUJiTyJ_Abjnbuna0TTqsLlh1W8TWS"
     func getNews(completionHandler: @escaping (Result<News, Error>) -> Void) {
        
        AF.request(url, method: .get).responseJSON { response in
            switch response.result {
            case .success:
                if let jsonData = response.data {
                    do {
                        let news = try JSONDecoder().decode(News.self, from: jsonData)
                        print("SOS NetworkManagerNews")
                        completionHandler(.success(news))
                    } catch let error {
                        completionHandler(.failure(error))
                    }
                }
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
}


