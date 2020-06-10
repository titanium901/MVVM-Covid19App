//
//  InfoViewController.swift
//  MVVM-Covid19App
//
//  Created by Iury Popov on 08.06.2020.
//  Copyright © 2020 Iurii Popov. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {
    
    private var globalInfoView: GlobalInfoView {
        view as! GlobalInfoView
    }
    
    override func loadView() {
        view = GlobalInfoView()
    }
    
    private var viewModel: CovidViewModelProtocol
    
    init(viewModel: CovidViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        viewModel.showGlobalInfo()
        _updateView()
    }
    
    private func _updateView() {
        viewModel.updateViewData = { [weak self] viewData in
            self?.globalInfoView.viewData = viewData
        }
    }
}
