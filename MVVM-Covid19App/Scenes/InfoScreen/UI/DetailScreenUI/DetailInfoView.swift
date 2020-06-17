//
//  DetailInfoView.swift
//  MVVM-Covid19App
//
//  Created by Iury Popov on 17.06.2020.
//  Copyright © 2020 Iurii Popov. All rights reserved.
//

import UIKit

class DetailInfoView: UIView {
    
    private lazy var stackView = update(UIStackView()) {
        $0.axis = .vertical
        $0.distribution = .equalSpacing
    }
    
    private lazy var countryNameLabel = update(UILabel()) {
        $0.applyGlobalStyle()
        $0.text = "Date:"
    }
    
    private lazy var newConfirmedLabel = update(UILabel()) {
        $0.applyGlobalStyle()
        $0.text = "New confirmed:"
    }
    
    private lazy var totalConfirmedLabel = update(UILabel()) {
        $0.applyGlobalStyle()
        $0.text = "Total confirmed:"
    }
    
    private lazy var newDeathsLabel = update(UILabel()) {
        $0.applyGlobalStyle()
        $0.text = "New deaths:"
    }
    
    private lazy var totalDeathsLabel = update(UILabel()) {
        $0.applyGlobalStyle()
        $0.text = "Total deaths:"
    }
    
    private lazy var newRecoveredLabel = update(UILabel()) {
        $0.applyGlobalStyle()
        $0.text = "New recovered:"
    }
    
    private lazy var totalRecoveredLabel = update(UILabel()) {
        $0.applyGlobalStyle()
        $0.text = "Total recovered:"
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        _setupLayout()
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func _setupLayout() {
        stackView.addArrangedSubview(countryNameLabel)
        stackView.addArrangedSubview(newConfirmedLabel)
        stackView.addArrangedSubview(totalConfirmedLabel)
        stackView.addArrangedSubview(newDeathsLabel)
        stackView.addArrangedSubview(totalDeathsLabel)
        stackView.addArrangedSubview(newRecoveredLabel)
        stackView.addArrangedSubview(totalRecoveredLabel)
        
        addSubview(stackView, constraints: [
            equal(\.topAnchor, \.safeAreaLayoutGuide.topAnchor, constant: 20),
            equal(\.leadingAnchor, constant: 20),
            equal(\.trailingAnchor, constant: -20),
            equal(\.heightAnchor, constant: 250)
        ])
    }
}

extension DetailInfoView {
    enum ViewState {
        case success(Country)
    }

    func render(_ state: ViewState) {
        switch state {
        case .success(let success):
            _render(viewData: success)
        }
    }

    private func _render(viewData: Country) {
        countryNameLabel.text = viewData.country
        newConfirmedLabel.text = "New confirmed: \(viewData.newConfirmed)"
        totalConfirmedLabel.text = "Total confirmed: \(viewData.totalConfirmed)"
        newDeathsLabel.text = "New deaths: \(viewData.newDeaths)"
        totalDeathsLabel.text = "Total deaths: \(viewData.totalDeaths)"
        newRecoveredLabel.text = "New recovered: \(viewData.newRecovered)"
        totalRecoveredLabel.text = "Total recovered: \(viewData.totalRecovered)"
    }
}
