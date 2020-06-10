//
//  GlobalInfoView.swift
//  MVVM-Covid19App
//
//  Created by Iury Popov on 10.06.2020.
//  Copyright © 2020 Iurii Popov. All rights reserved.
//

import UIKit

class GlobalInfoView: UIView {
    
    var viewData: CovidViewData = .initial {
        didSet {
            setNeedsLayout()
        }
    }
    
    private let newConfirmedLabel = update(UILabel()) {
        $0.adjustsFontSizeToFitWidth = true
        $0.textColor = .label
        $0.minimumScaleFactor = 0.9
        $0.lineBreakMode = .byTruncatingTail
        $0.textAlignment = .center
        $0.font = UIFont.systemFont(ofSize: 26, weight: .bold)
        $0.text = "New Case Label"
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        _setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func _setupLayout() {
        addSubview(newConfirmedLabel, constraints: [
            equal(\.topAnchor, \.safeAreaLayoutGuide.topAnchor, constant: 10),
            equal(\.leadingAnchor, constant: 20),
            equal(\.trailingAnchor, constant: -20)
        ])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        switch viewData {
        case .initial:
            print("SOS initial")
        case .loading:
            print("SOS loading")
        case .success(let success):
            _update(covid: success)
        case .failure:
            print("SOS fail")
        }
    }
    
    private func _update(covid: CovidViewData.Covid) {
        newConfirmedLabel.text = "\(covid.global?.newConfirmed)"
    }
}
