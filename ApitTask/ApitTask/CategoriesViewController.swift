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
        
//        self.fetchJsonDataUsingAlamofire { (complete) in
//            if complete {
//                self.categoryTableView.reloadData()
//            }
//        }
        
        self.fetchJsonDataFromHardCodedData { (complete) in
            if complete {
                self.categoryTableView.reloadData()
            }
        }
    }
    
    
    // MARK: Delegation
    
    func setDelegateForUIControls() {
        categoryTableView.delegate = self
        categoryTableView.dataSource = self
    }
    
    
    // MARK: JSON Parsing
    
    // MARK: JSON Parsing Using Alamofire
    func fetchJsonDataUsingAlamofire(_ handler: @escaping(_ status: Bool) ->() ) {
        
        var categorySIKEY: Int = 0
        var categoryLDESC: String = ""
        var categoryADESC: String = ""
        var categoryVALUE: String = ""
        var categoryACTIVE: Bool = true
        
        
        Alamofire.request(getCategoriesWebAPI()).responseJSON { (response) in
            if let categoriesArray = response.result.value as? [Dictionary<String, AnyObject>] {
                for category in categoriesArray {
                    if let SIKEY = category["SIKEY"] as? Int {
                        categorySIKEY = SIKEY
                    }
                    
                    if let LDESC = category["LDESC"] as? String {
                        categoryLDESC = LDESC
                    } else {
                        categoryLDESC = "غير متوفر"
                    }
                    
                    if let ADESC = category["ADESC"] as? String {
                        categoryADESC = ADESC
                    } else {
                        categoryADESC = "غير متوفر"
                    }
                    
                    if let VALUE = category["VALUE"] as? String {
                        categoryVALUE = VALUE
                    } else {
                        categoryVALUE = "غير متوفر"
                    }
                    
                    if let ACTIVE = category["ACTIVE"] as? Bool {
                        categoryACTIVE = ACTIVE
                    }
                    
                    self.categories.append(Category(withSIKEY: categorySIKEY, LDESC: categoryLDESC, ADESC: categoryADESC, VALUE: categoryVALUE, andACTIVE: categoryACTIVE))
                }
                
                print(self.categories.count)
                handler(true)
            } else {
                handler(false)
            }
        }
    }
    
    // MARK: JSON Parsing Using Hard Coded JSON Data.
    func fetchJsonDataFromHardCodedData(_ handler: @escaping(_ status: Bool) ->() ) {
        let categoriesArray = [[ "SIKEY" : 1, "LDESC" : "قطاع الاسكان", "ADESC" : "قطاع الاسكان", "VALUE" : nil, "ACTIVE" : true],
                               ["SIKEY" : 2, "LDESC" : "قطاع مشعر منى", "ADESC" : "قطاع مشعر منى", "VALUE" : nil, "ACTIVE" : true],
                               ["SIKEY" : 4, "LDESC" : "قطاع النقل والتصعيد", "ADESC" : "قطاع النقل والتصعيد", "VALUE" : nil, "ACTIVE" : true],
                               ["SIKEY" : 5, "LDESC" : "قطاع الاستقبال والجوازات", "ADESC" : "قطاع الاستقبال والجوازات", "VALUE" : nil, "ACTIVE" : true],
                               ["SIKEY" : 6, "LDESC" : "قطاع التغذية", "ADESC" : "قطاع التغذية", "VALUE" : nil, "ACTIVE" : true],
                               ["SIKEY" : 7, "LDESC" : "قطاع التفويج لجسر الجمرات والقطار", "ADESC" : "قطاع التفويج لجسر الجمرات والقطار", "VALUE" : nil, "ACTIVE" : true],
                               ["SIKEY" : 8, "LDESC" : "قطاع مشعر عرفات", "ADESC" : "قطاع مشعر عرفات", "VALUE" : nil, "ACTIVE" : true],
                               ["SIKEY" : 9, "LDESC" : "قطاع التوعية الدينية والشؤون العامة", "ADESC" : "قطاع التوعية الدينية والشؤون العامة", "VALUE" : nil, "ACTIVE" : true]]
        
        var categorySIKEY: Int = 0
        var categoryLDESC: String = ""
        var categoryADESC: String = ""
        var categoryVALUE: String = ""
        var categoryACTIVE: Bool = true
        
        for category in categoriesArray {
            if let SIKEY = category["SIKEY"] as? Int {
                categorySIKEY = SIKEY
            }
            
            if let LDESC = category["LDESC"] as? String {
                categoryLDESC = LDESC
            } else {
                categoryLDESC = "غير متوفر"
            }
            
            if let ADESC = category["ADESC"] as? String {
                categoryADESC = ADESC
            } else {
                categoryADESC = "غير متوفر"
            }
            
            if let VALUE = category["VALUE"] as? String {
                categoryVALUE = VALUE
            } else {
                categoryVALUE = "غير متوفر"
            }
            
            if let ACTIVE = category["ACTIVE"] as? Bool {
                categoryACTIVE = ACTIVE
            }
            
            self.categories.append(Category(withSIKEY: categorySIKEY, LDESC: categoryLDESC, ADESC: categoryADESC, VALUE: categoryVALUE, andACTIVE: categoryACTIVE))
        }
        
        print(self.categories.count)
        handler(true)
    }
}

