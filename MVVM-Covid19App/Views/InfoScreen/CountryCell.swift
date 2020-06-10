//
//  CountryCell.swift
//  MVVM-Covid19App
//
//  Created by Iury Popov on 10.06.2020.
//  Copyright © 2020 Iurii Popov. All rights reserved.
//

import UIKit

class CountryCell: UITableViewCell {
    
    static let reuseID = "CountryCell"
    
    private lazy var stackView = update(UIStackView()) {
        $0.axis = .vertical
        $0.alignment = .leading
        $0.distribution = .fillEqually
    }
    
    private let countryName = update(UILabel()) {
        $0.applyStyleForCountryCell()
    }
    private let newConfirmed = update(UILabel()) {
        $0.applyStyleForCountryCell()
    }
    private let totalConfirmed = update(UILabel()) {
        $0.applyStyleForCountryCell()
    }
    private let newDeaths = update(UILabel()) {
        $0.applyStyleForCountryCell()
    }
    private let totalDeaths = update(UILabel()) {
        $0.applyStyleForCountryCell()
    }
    private let newRecovered = update(UILabel()) {
        $0.applyStyleForCountryCell()
    }
    
    private let totalRecovered = update(UILabel()) {
        $0.applyStyleForCountryCell()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        _setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(country: Country) {
        countryName.text = "Country: \(country.country)"
        newConfirmed.text = "NewConfirmed: \(country.newConfirmed)"
        totalConfirmed.text = "TotalConfirmed: \(country.totalConfirmed)"
        newDeaths.text = "NewDeaths: \(country.newDeaths)"
        totalDeaths.text = "TotalDeaths: \(country.totalDeaths)"
        newRecovered.text = "NewRecovered: \(country.newRecovered)"
        totalRecovered.text = "TotalRecovered: \(country.totalRecovered)"
    }
    
    private func _setupLayout() {
        stackView.addArrangedSubview(countryName)
        stackView.addArrangedSubview(newConfirmed)
        stackView.addArrangedSubview(totalConfirmed)
        stackView.addArrangedSubview(newDeaths)
        stackView.addArrangedSubview(totalDeaths)
        stackView.addArrangedSubview(newRecovered)
        stackView.addArrangedSubview(totalRecovered)
        
        addSubview(stackView, constraints: .allAnchors)
    }
}

//
//Country": "Zimbabwe",
//"CountryCode": "ZW",
//"Slug": "zimbabwe",
//"NewConfirmed": 5,
//"TotalConfirmed": 287,
//"NewDeaths": 0,
//"TotalDeaths": 4,
//"NewRecovered": 12,
//"TotalRecovered": 46,
//"Date": "2020-06-09T11:18:54Z"
