//
//  Category.swift
//  ApitTask
//
//  Created by Ahmed Elbasha on 11/15/18.
//  Copyright © 2018 Ahmed Elbasha. All rights reserved.
//

import UIKit

class Category: NSObject {
    var SIKEY: Int = 0
    var LDESC: String = ""
    var ADESC: String = ""
    var VALUE: String = ""
    var ACTIVE: Bool = true
    
    init(withSIKEY SIKEY: Int, LDESC: String, ADESC: String, VALUE: String, andACTIVE ACTIVE: Bool) {
        self.SIKEY = SIKEY
        self.LDESC = LDESC
        self.ADESC = ADESC
        self.VALUE = VALUE
        self.ACTIVE = ACTIVE
    }
}
