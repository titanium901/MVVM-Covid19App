//
//  MapViewController.swift
//  MVVM-Covid19App
//
//  Created by Iury Popov on 08.06.2020.
//  Copyright © 2020 Iurii Popov. All rights reserved.
//

import UIKit

class MapViewController: UIViewController {
    
    private var mapView: MapView {
        view as! MapView
    }
    
    override func loadView() {
        view = MapView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
