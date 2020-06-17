//
//  DetailsInfoViewController.swift
//  MVVM-Covid19App
//
//  Created by Iury Popov on 16.06.2020.
//  Copyright © 2020 Iurii Popov. All rights reserved.
//

import UIKit

class DetailsInfoViewController: UIViewController {
    
    private var detailInfoView: DetailInfoView {
        view as! DetailInfoView
    }
    
    override func loadView() {
        view = DetailInfoView()
    }
    
    let country: Country
    
    init(country: Country) {
        self.country = country
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailInfoView.render(.success(country))
        print("SOS DetailsInfoViewController")
    }
}
