//
//  NetworkManagerGlobal.swift
//  MVVM-Covid19App
//
//  Created by Iury Popov on 09.06.2020.
//  Copyright © 2020 Iurii Popov. All rights reserved.
//

import Alamofire

class NetworkManagerCovid {
    
     func getCovidStatus(completionHandler: @escaping (Result<CovidViewData.Covid, Error>) -> Void) {
        AF.request("https://api.covid19api.com/summary", method: .get).responseJSON { response in
            switch response.result {
            case .success:
                if let jsonData = response.data {
                    do {
                        let covid = try JSONDecoder().decode(CovidViewData.Covid.self, from: jsonData)
                        print("SOS \(covid.date)")
                        completionHandler(.success(covid))
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
