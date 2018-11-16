//
//  CategoriesDelegation.swift
//  ApitTask
//
//  Created by Ahmed Elbasha on 11/16/18.
//  Copyright © 2018 Ahmed Elbasha. All rights reserved.
//

import UIKit

extension CategoriesViewController {
    // MARK: Delegation
    
    // MARK: Set Delegate and DataSource for categoriesTableView
    func setDelegateForUIControls() {
        categoryTableView.delegate = self
        categoryTableView.dataSource = self
    }
}
