//
//  Medicine.swift
//  HealthCare
//
//  Created by Phat Tran on 7/16/20.
//  Copyright © 2020 Phat Tran. All rights reserved.
//

import UIKit
import RealmSwift

class Reminder: Object {
    
    static var sharedInstance = Reminder()
    
    @objc dynamic var id: Int = 0
    @objc dynamic var tittle: String = ""
    @objc dynamic var date = Date()
    @objc dynamic var note: String = ""
    @objc dynamic var doctorId: Int = 0
    
    var medList = List<MedicineModel>()
    
    override class func primaryKey() -> String {
        return "id"
    }
}

class MedicineModel: Object {
    
    static var sharedInstance = MedicineModel()
    
    @objc dynamic var medId: Int = 0
    @objc dynamic var medName: String = ""
    @objc dynamic var medQuantity: Int = 0
    
}
