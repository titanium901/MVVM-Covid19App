//
//  UILabel + Ext.swift
//  MVVM-Covid19App
//
//  Created by Iury Popov on 10.06.2020.
//  Copyright © 2020 Iurii Popov. All rights reserved.
//

import UIKit

extension UILabel {
    func applyGlobalStyle() {
        adjustsFontSizeToFitWidth = true
        textColor = .label
        minimumScaleFactor = 0.9
        lineBreakMode = .byTruncatingTail
        textAlignment = .left
        font = UIFont.systemFont(ofSize: 26, weight: .bold)
    }
    
    func applyStyleForCountryCell() {
        textAlignment = .left
        adjustsFontSizeToFitWidth = true
        textColor = .label
        minimumScaleFactor = 0.9
        lineBreakMode = .byTruncatingTail
        textAlignment = .center
        font = UIFont.systemFont(ofSize: 15, weight: .bold)
    }
}
