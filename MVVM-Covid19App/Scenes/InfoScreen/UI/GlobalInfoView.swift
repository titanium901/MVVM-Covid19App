//
//  GlobalInfoView.swift
//  MVVM-Covid19App
//
//  Created by Iury Popov on 10.06.2020.
//  Copyright © 2020 Iurii Popov. All rights reserved.
//

import UIKit

class GlobalInfoView: UIView {

    // зачем вью хранит модель?
//    var viewData: CovidViewData = .initial {
//        didSet {
//            setNeedsLayout()
//        }
//    }
    
    private lazy var stackView = update(UIStackView()) {
        $0.axis = .vertical
        $0.distribution = .equalSpacing
    }
    
    private lazy var dateLabel = update(UILabel()) {
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
    
    lazy var tableView = update(UITableView()) {
        $0.frame = self.bounds
        $0.rowHeight = 150
//        $0.removeExcessCells()
        $0.register(CountryCell.self, forCellReuseIdentifier: CountryCell.reuseID)
    }
    
    private lazy var activityIndicator = update(UIActivityIndicatorView()) {
        $0.startAnimating()
        $0.style = .large
        $0.color = .systemBlue
        $0.hidesWhenStopped = true
    }
    
    private lazy var loadGif = update(UIImageView()) {
        guard let loadImage = UIImageView.fromGif(frame: self.frame, resourceName: "load") else
        { return }
        $0 = loadImage
        $0.animationDuration = 1.2
        loadImage.startAnimating()
    }

    var tableViewDelegate: UITableViewDelegate? {
        get {
            tableView.delegate
        }
        set {
            tableView.delegate = newValue
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        _setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func _setupLayout() {
        stackView.addArrangedSubview(dateLabel)
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
        
        addSubview(tableView, constraints: [
            equal(\.topAnchor, to: stackView, \.bottomAnchor, constant: 5),
            equal(\.leadingAnchor, constant: 0),
            equal(\.trailingAnchor, constant: 0),
            equal(\.bottomAnchor)
        ])
        
        addSubview(activityIndicator, constraints: [
            equal(\.centerYAnchor),
            equal(\.centerXAnchor)
        ])
        
        addSubview(loadGif, constraints: [
            equal(\.topAnchor, \.safeAreaLayoutGuide.topAnchor, constant: 20),
            equal(\.leadingAnchor, constant: 20),
            equal(\.trailingAnchor, constant: -20),
            equal(\.heightAnchor, to: stackView, \.heightAnchor),
            equal(\.widthAnchor, to: stackView, \.widthAnchor)
        ])
    }

    // зачем layoutSubviews?
//    override func layoutSubviews() {
//        super.layoutSubviews()
//
//        switch viewData {
//        case .initial:
//            print("SOS initial")
//        case .loading:
//            print("SOS loading")
//        case .success(let success):
//            activityIndicator.stopAnimating()
//            _update(viewData: success)
//        case .failure:
//            print("SOS fail")
//        }
//    }
}

extension GlobalInfoView {
    enum ViewState {
        case initial
        case loading
        case success(Covid)
        case failure
    }

    func render(_ state: ViewState) {
        switch state {
        case .initial:
            print("SOS initial")
        case .loading:
            print("SOS loading")
        case .success(let success):
            activityIndicator.stopAnimating()
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) { [weak self] in
                self?.loadGif.stopAnimating()
            }
            _render(viewData: success)
        case .failure:
            print("SOS fail")
        }
    }

    private func _render(viewData: Covid) {
        dateLabel.text = "Date: \(viewData.date ?? "")"
        newConfirmedLabel.text = "New confirmed: \(viewData.global?.newConfirmed ?? 0)"
        totalConfirmedLabel.text = "Total confirmed: \(viewData.global?.totalConfirmed ?? 0)"
        newDeathsLabel.text = "New deaths: \(viewData.global?.newDeaths ?? 0)"
        totalDeathsLabel.text = "Total deaths: \(viewData.global?.totalDeaths ?? 0)"
        newRecoveredLabel.text = "New recovered: \(viewData.global?.newRecovered ?? 0)"
        totalRecoveredLabel.text = "Total recovered: \(viewData.global?.totalRecovered ?? 0)"
    }
}
