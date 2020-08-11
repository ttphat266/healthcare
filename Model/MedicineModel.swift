//
//  Medicine.swift
//  HealthCare
//
//  Created by Phat Tran on 7/16/20.
//  Copyright © 2020 Phat Tran. All rights reserved.
//

import UIKit
import RealmSwift

class MedicineModel: Object {
    
    @objc dynamic var medId = 0
    @objc dynamic var medName = ""
//    @objc dynamic var medUsage = ""
    
    
//    convenience init(medicineId: Int, medicineName: String, medicineUsage: String) {
//        self.init()
//        self.medicineId = medicineId
//        self.medicineName = medicineName
//        self.medicineUsage = medicineUsage
//    }
}

