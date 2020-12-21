//
//  BaseViewController.swift
//  BiPhone
//
//  Created by Kerim Njuhovic on 20/12/2020.
//

import UIKit

class BaseViewController: UIViewController {
    
    var screenTitle: String = "" {
        didSet {
            self.navigationController?.navigationBar.topItem?.title = screenTitle
        }
    }
    
    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavigationBar()
    }
    
}

// MARK: - Fileprivate stuff -

fileprivate extension BaseViewController {
    
    func setupNavigationBar() {
        self.navigationController?.navigationBar.barTintColor = UIColor.white
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    
}
