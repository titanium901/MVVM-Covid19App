//
//  NewsInfoView.swift
//  MVVM-Covid19App
//
//  Created by Iury Popov on 29.06.2020.
//  Copyright © 2020 Iurii Popov. All rights reserved.
//

import UIKit

class NewsInfoView: UIView {
    
    private lazy var newsImage = update(UIImageView()) {
        $0.image = UIImage(named: "news")
        $0.contentMode = .scaleAspectFit
    }
    lazy var refreshControl = update(UIRefreshControl()) {
        $0.tintColor = .systemBlue
    }
    lazy var loadGif = update(UIImageView()) {
        guard let loadImage = UIImageView.fromGif(frame: self.frame, resourceName: "newsGif") else
        { return }
        $0 = loadImage
        $0.animationDuration = 3
        loadImage.startAnimating()
    }
    
    let collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 0, bottom: 20, right: 0)
        let width = UIScreen.main.bounds.width - 20
        layout.itemSize = CGSize(width: width , height: width / 2)
        layout.minimumInteritemSpacing = 2
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(NewsCell.self, forCellWithReuseIdentifier: NewsCell.reuseID)
        cv.backgroundColor = .clear
        cv.alwaysBounceVertical = true
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        _setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func _setupLayout() {
        collectionView.addSubview(refreshControl)
        
        addSubview(newsImage, constraints: [
            equal(\.topAnchor, \.safeAreaLayoutGuide.topAnchor, constant: 30),
            equal(\.leadingAnchor, constant: 0),
            equal(\.trailingAnchor, constant: 0),
            equal(\.heightAnchor, constant: 100),
            equal(\.widthAnchor, constant: 100),
        ])
        
        addSubview(loadGif, constraints: [
            equal(\.centerYAnchor),
            equal(\.centerXAnchor)
        ])
        
        addSubview(collectionView, constraints: [
            equal(\.topAnchor, to: newsImage, \.bottomAnchor, constant: 5),
            equal(\.leadingAnchor, constant: 0),
            equal(\.trailingAnchor, constant: 0),
            equal(\.bottomAnchor)
        ])
    }
}

