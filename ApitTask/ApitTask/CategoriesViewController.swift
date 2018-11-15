//
//  CategoriesViewController.swift
//  ApitTask
//
//  Created by Ahmed Elbasha on 11/15/18.
//  Copyright © 2018 Ahmed Elbasha. All rights reserved.
//

import UIKit

class CategoriesViewController: UIViewController {

    @IBOutlet weak var categoryTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setDelegateForUIControls()
    }
    
    
    // MARK: Delegation
    
    func setDelegateForUIControls() {
        categoryTableView.delegate = self
        categoryTableView.dataSource = self
    }
}

