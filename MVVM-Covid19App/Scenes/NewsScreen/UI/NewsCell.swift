//
//  NewsCell.swift
//  MVVM-Covid19App
//
//  Created by Iury Popov on 29.06.2020.
//  Copyright © 2020 Iurii Popov. All rights reserved.
//

import UIKit

class NewsCell: UICollectionViewCell {
    
    static let reuseID = "NewsCell"
    
    private lazy var newsImage = update(UIImageView()) {
        $0.contentMode = .scaleAspectFit
    }
    private lazy var stackView = update(UIStackView()) {
        $0.axis = .vertical
        $0.alignment = .leading
        $0.distribution = .fillEqually
    }
    private let newsTitle = update(UILabel()) {
        $0.textColor = .black
        $0.numberOfLines = 0
    }
    private let newsAuthor = update(UILabel()) {
        $0.textColor = .black
    }
    private let newsPublished = update(UILabel()) {
        $0.textColor = .black
    }
    private let newsUrl = update(UILabel()) {
        $0.textColor = .black
        $0.numberOfLines = 0
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        _setupLayout()
        _configureStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func render(news: NewsElement) {
        newsTitle.text = news.title
        newsAuthor.text = "Author: \(news.author)"
        newsUrl.text = news.url
        newsPublished.text = news.published
    }
    
    private func _setupLayout() {
        stackView.addArrangedSubview(newsTitle)
        stackView.addArrangedSubview(newsAuthor)
        stackView.addArrangedSubview(newsUrl)
        stackView.addArrangedSubview(newsPublished)
        
        addSubview(stackView, constraints: [
            equal(\.topAnchor, constant: 5),
            equal(\.leadingAnchor, constant: 10),
            equal(\.trailingAnchor, constant: 10),
            equal(\.bottomAnchor)
        ])
    }
    
    private func _configureStyle() {
        self.layer.cornerRadius = 10
        self.layer.borderWidth = 3.0
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 2.0, height: 4.0)
        self.layer.shadowRadius = 2.0
        self.layer.shadowOpacity = 1.0
        self.layer.masksToBounds = true
    }
}
