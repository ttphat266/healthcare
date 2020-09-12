//
//  Medicine.swift
//  HealthCare
//
//  Created by Phat Tran on 7/16/20.
//  Copyright © 2020 Phat Tran. All rights reserved.
//

import UIKit
import RealmSwift

class ReminderItem: Object {
    
    @objc dynamic var reminderTittle: String = ""
    @objc dynamic var reminderDate = Date()
    @objc dynamic var reminderNote: String = ""
    
    var medList = List<MedicineItem>()
    
}

class MedicineItem: Object {
    
    @objc dynamic var medId: Int = 0
    @objc dynamic var medName: String = ""
    @objc dynamic var medQuantity: Int = 0
    
}



