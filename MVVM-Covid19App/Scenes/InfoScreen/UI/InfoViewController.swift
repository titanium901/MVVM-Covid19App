//
//  InfoViewController.swift
//  MVVM-Covid19App
//
//  Created by Iury Popov on 08.06.2020.
//  Copyright © 2020 Iurii Popov. All rights reserved.
//

import UIKit

// навигация
/*
 в контроллер положить фабрику
 можно добавить роутер (паттерн)
 можно добавить координаторы
 ?? свое решение
*/

// добавим loading, emptystate

class InfoViewController: UIViewController {
    
    private var globalInfoView: GlobalInfoView {
        view as! GlobalInfoView
    }
    
    override func loadView() {
        view = GlobalInfoView()
    }
    
    private var viewModel: CovidViewModel
    
    init(viewModel: CovidViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // можно продублировать проперти в globalInfoView
        // и заприватить tableView
        globalInfoView.tableView.delegate = self
        globalInfoView.tableView.dataSource = self

        viewModel.showGlobalInfo() // viewModel.viewDidLoad()
        _updateView()
    }

    // метод по факту делает subscribeOnChanges
    private func _updateView() {
        viewModel.updateViewData = { [weak self] viewData in
            self?.globalInfoView.render(viewData)
//            self?.globalInfoView.viewData = viewData
        }
        viewModel.showCountriesInfo {
            self.globalInfoView.tableView.reloadData()
        }
    }
}

//class InfoTableViewDelegate: UITableViewDataSource, UITableViewDelegate {
//    let viewModel: CovidViewModel
//
//    init(viewModel: CovidViewModel) {
//        self.viewModel = viewModel
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return viewModel.countries.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: CountryCell.reuseID) as! CountryCell
//        let country = viewModel.countries[indexPath.row]
//        cell.set(country: country) // render и будет datadriven
//        return cell
//    }
//}

// RxDataSource
// https://github.com/DenTelezhkin/DTTableViewManager
extension InfoViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CountryCell.reuseID) as! CountryCell
        let country = viewModel.countries[indexPath.row]
        cell.set(country: country) // render и будет datadriven
        return cell
    }
}
