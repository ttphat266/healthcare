//
//  PillViewController.swift
//  HealthCare
//
//  Created by Phat Tran on 7/16/20.
//  Copyright © 2020 Phat Tran. All rights reserved.
//

import UIKit

class PillModel: NSObject {

    var pillId = 0
    var pillName = ""
    
    init(pillId: Int, pillName: String ) {
        self.pillId = pillId
        self.pillName = pillName
    }
}
