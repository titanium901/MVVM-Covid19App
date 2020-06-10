//
//  RootViewController.swift
//  MVVM-Covid19App
//
//  Created by Iury Popov on 08.06.2020.
//  Copyright © 2020 Iurii Popov. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {
    
    private let mainTabBarController: UITabBarController
    
    init(mainTabBarController: UITabBarController) {
        self.mainTabBarController = mainTabBarController
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        let view = UIView(frame: .zero)
        _installChild(mainTabBarController, in: view)
        self.view = view
    }
    
    private func _installChild(_ controller: UIViewController, in host: UIView) {
        addChild(controller)
        controller.view.frame = host.bounds
        controller.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        host.addSubview(controller.view)
        controller.didMove(toParent: self)
    }
}
