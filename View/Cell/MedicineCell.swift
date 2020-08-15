//
//  MedicineCell.swift
//  HealthCare
//
//  Created by Phat Tran on 8/15/20.
//  Copyright © 2020 Phat Tran. All rights reserved.
//

import UIKit

class MedicineCell: UITableViewCell {

    @IBOutlet weak var medNameLabel: UILabel!
    
    func config(model: MedicineModel) {
        self.medNameLabel.text = model.medText
    }
}
