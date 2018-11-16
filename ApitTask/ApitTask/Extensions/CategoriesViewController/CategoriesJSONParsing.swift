//
//  CategoriesJSONParsing.swift
//  ApitTask
//
//  Created by Ahmed Elbasha on 11/16/18.
//  Copyright © 2018 Ahmed Elbasha. All rights reserved.
//

import UIKit
import Alamofire

extension CategoriesViewController {
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
                
                // Extract Category objects from JSON Data.
                for category in categoriesArray {
                    
                    // Store SIKEY value
                    if let SIKEY = category["SIKEY"] as? Int {
                        categorySIKEY = SIKEY
                    }
                    
                    // Store LDESC value
                    if let LDESC = category["LDESC"] as? String {
                        categoryLDESC = LDESC
                    } else {
                        categoryLDESC = "غير متوفر"
                    }
                    
                    // Store ADESC value
                    if let ADESC = category["ADESC"] as? String {
                        categoryADESC = ADESC
                    } else {
                        categoryADESC = "غير متوفر"
                    }
                    
                    // Store VALUE value
                    if let VALUE = category["VALUE"] as? String {
                        categoryVALUE = VALUE
                    } else {
                        categoryVALUE = "غير متوفر"
                    }
                    
                    // Store ACTIVE value
                    if let ACTIVE = category["ACTIVE"] as? Bool {
                        categoryACTIVE = ACTIVE
                    }
                    
                    // Append new Category object to categories array.
                    self.categories.append(Category(withSIKEY: categorySIKEY, LDESC: categoryLDESC, ADESC: categoryADESC, VALUE: categoryVALUE, andACTIVE: categoryACTIVE))
                }
                
                handler(true)
            } else {
                handler(false)
            }
        }
    }
    
    // Perform Fetch JSON Data Using Alamofire Process
    func performFetchJsonDataUsingAlamofireProcess() {
        self.fetchJsonDataUsingAlamofire { (complete) in
            if complete {
                self.categoryTableView.reloadData()
            }
        }
        
    }
    
    // MARK: JSON Parsing Using Hard Coded JSON Data.
    func fetchJsonDataFromHardCodedData(_ handler: @escaping(_ status: Bool) ->() ) {
        
        // Parse JSON Data in Array of Dictionary<String, AnyObject>
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
        
        // Extract Category objects from JSON Data.
        for category in categoriesArray {
            
            // Store SIKEY value
            if let SIKEY = category["SIKEY"] as? Int {
                categorySIKEY = SIKEY
            }
            
            // Store LDESC value
            if let LDESC = category["LDESC"] as? String {
                categoryLDESC = LDESC
            } else {
                categoryLDESC = "غير متوفر"
            }
            
            // Store ADESC value
            if let ADESC = category["ADESC"] as? String {
                categoryADESC = ADESC
            } else {
                categoryADESC = "غير متوفر"
            }
            
            // Store VALUE value
            if let VALUE = category["VALUE"] as? String {
                categoryVALUE = VALUE
            } else {
                categoryVALUE = "غير متوفر"
            }
            
            // Store ACTIVE value
            if let ACTIVE = category["ACTIVE"] as? Bool {
                categoryACTIVE = ACTIVE
            }
            
            // Append new Category object to categories array.
            self.categories.append(Category(withSIKEY: categorySIKEY, LDESC: categoryLDESC, ADESC: categoryADESC, VALUE: categoryVALUE, andACTIVE: categoryACTIVE))
        }
        
        handler(true)
    }
    
    //Perform Fetch JSON Data From Hard Coded Data Process
    func performFetchJsonDataFromHardCodedDataProcess() {
        self.fetchJsonDataFromHardCodedData { (complete) in
            if complete {
                self.categoryTableView.reloadData()
            }
        }
    }
}
