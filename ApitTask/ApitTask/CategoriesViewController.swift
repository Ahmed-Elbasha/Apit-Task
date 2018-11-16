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

    // MARK: IBOutlets
    @IBOutlet weak var categoryTableView: UITableView!
    
    // MARK: Class Attributes
    var categories = [Category]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setDelegateForUIControls()
        
        self.performFetchJsonDataUsingAlamofireProcess()
        
        self.performFetchJsonDataFromHardCodedDataProcess()
    }
    
    
    
    
    
    
}

