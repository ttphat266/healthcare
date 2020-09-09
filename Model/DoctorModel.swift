//
//  DoctorModel.swift
//  HealthCare
//
//  Created by Phat Tran on 7/23/20.
//  Copyright © 2020 Phat Tran. All rights reserved.
//

import Foundation

class DoctorModel {
    
    var doctorName = ""
    var doctorMail = ""
    var doctorAddress = ""
    var officeNumber = ""
    var mobileNumber = ""
    
    init(doctorName: String, doctorMail: String, doctorAddress: String, officeNumber: String, mobileNumber: String) {
        self.doctorName = doctorName
        self.doctorMail = doctorMail
        self.doctorAddress = doctorAddress
        self.officeNumber = officeNumber
        self.mobileNumber = mobileNumber
    }
}
