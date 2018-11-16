//
//  CategoriesViewController.swift
//  ApitTask
//
//  Created by Ahmed Elbasha on 11/15/18.
//  Copyright © 2018 Ahmed Elbasha. All rights reserved.
//

import UIKit
import Alamofire

class CategoriesViewController: UIViewController {

    @IBOutlet weak var categoryTableView: UITableView!
    
    var categories = [Category]()
    
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

