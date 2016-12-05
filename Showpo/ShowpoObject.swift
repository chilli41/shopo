//
//  ShowpoObject.swift
//  Showpo
//
//  Created by Thadz on 24/10/2016.
//  Copyright © 2016 Thousandminds. All rights reserved.
//

import Foundation

class ShowpoObject {
    
    //database reference
    let id: Int64?
    
    //object keys
    var name: String
    var phone: String
    var address: String
    
    init(id: Int64) {
        self.id = id
        name = ""
        phone = ""
        address = ""
    }
    
    init(id: Int64, name: String, phone: String, address: String) {
        self.id = id
        self.name = name
        self.phone = phone
        self.address = address
    }
}
