//
//  NewsViewController.swift
//  MVVM-Covid19App
//
//  Created by Iury Popov on 08.06.2020.
//  Copyright © 2020 Iurii Popov. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController {
    
    private var newsView: NewsInfoView {
        view as! NewsInfoView
    }
    
    override func loadView() {
        view = NewsInfoView()
    }
    
    private let viewModel: NewsViewModel
    private var coordinator: NewsViewCoordinator?
    
    init(viewModel: NewsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        coordinator = NewsViewCoordinator(presenter: navigationController ?? UINavigationController())
        _configure()
        viewModel.viewDidLoad { [weak self] in
            self?.newsView.loadGif.stopAnimating()
            self?.newsView.collectionView.reloadData()
        }
    }
    
    private func _configure() {
        newsView.refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        newsView.collectionView.delegate = self
        newsView.collectionView.dataSource = self
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    @objc private func refresh() {
        viewModel.viewDidLoad { [weak self] in
            self?.newsView.refreshControl.endRefreshing()
            self?.newsView.collectionView.reloadData()
        }
    }
}

extension NewsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.news.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewsCell.reuseID, for: indexPath) as! NewsCell
        let news = viewModel.news[indexPath.row]
        cell.render(news: news)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let url = URL(string: viewModel.news[indexPath.row].url) else { return }
        coordinator?.presentSafariViewController(with: url)
    }
}
