//
//  MapInfoView.swift
//  MVVM-Covid19App
//
//  Created by Iury Popov on 30.06.2020.
//  Copyright © 2020 Iurii Popov. All rights reserved.
//

import UIKit
import MapKit

class MapView: UIView {
    
    private lazy var map = update(MKMapView()) {
        $0
    }
    private lazy var searchBar = update(UISearchBar()) {
        $0
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        _setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func _setupLayout() {
        addSubview(searchBar, constraints: [
            equal(\.topAnchor, \.safeAreaLayoutGuide.topAnchor),
            equal(\.leadingAnchor),
            equal(\.trailingAnchor),
        ])
        
        addSubview(map, constraints: [
            equal(\.topAnchor, to: searchBar, \.bottomAnchor),
            equal(\.leadingAnchor),
            equal(\.trailingAnchor),
            equal(\.bottomAnchor)
        ])
    }
}
