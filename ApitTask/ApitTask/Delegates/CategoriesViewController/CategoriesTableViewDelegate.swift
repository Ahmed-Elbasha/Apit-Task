//
//  CategoriesTableViewDelegate.swift
//  ApitTask
//
//  Created by Ahmed Elbasha on 11/15/18.
//  Copyright © 2018 Ahmed Elbasha. All rights reserved.
//

import UIKit

extension CategoriesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell") as? CategoryCell else {return UITableViewCell()}
        
        let currentCategory = categories[indexPath.row]
        
        var departmentStatus = ""
        
        cell.departmentNameLabel.text = currentCategory.LDESC
        cell.departmentInformationLabel.text = currentCategory.VALUE
        
        if currentCategory.ACTIVE == true {
            departmentStatus =  "نشط"
        } else {
            departmentStatus = "غير نشط"
        }
        
        cell.departmentActivityLabel.text = departmentStatus
        
        return cell
    }
}
