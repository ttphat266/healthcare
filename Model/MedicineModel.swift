//
//  Medicine.swift
//  HealthCare
//
//  Created by Phat Tran on 7/16/20.
//  Copyright © 2020 Phat Tran. All rights reserved.
//

import UIKit

enum MedicineLevel: Int {
    case Hard = 1
    case Low = 2
}

class MedicineModel: NSObject {
    
    var medicineId = 0
    var medicineName = ""
    var medicineUsage = ""
    
    init(medicineId: Int, medicineName: String, medicineUsage: String) {
        self.medicineId = medicineId
        self.medicineName = medicineName
        self.medicineUsage = medicineUsage
    }
}

