//
//  InfoViewController.swift
//  MVVM-Covid19App
//
//  Created by Iury Popov on 08.06.2020.
//  Copyright © 2020 Iurii Popov. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        let cv = CovidRepository(networkManager: NetworkManagerCovid())
        cv.loadCovidFromNetwork { (cv, er) in
            
        }
    }
}
