//
//  MedicineCell.swift
//  HealthCare
//
//  Created by Phat Tran on 8/15/20.
//  Copyright © 2020 Phat Tran. All rights reserved.
//

import UIKit

class MedicineCell: UITableViewCell {
    
    var presentQuantity: Int = 1
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.medQuantityLabel.text = String(presentQuantity)
    }
    
    @IBAction func minusButton() {
        if presentQuantity == 1 {
            print(presentQuantity)
            self.medQuantityLabel.text = String(self.presentQuantity)
        } else {
            presentQuantity -= 1
            print(presentQuantity)
            self.medQuantityLabel.text = String(self.presentQuantity)
        }
    }
    
    @IBAction func plusButton() {
        presentQuantity += 1
        print(presentQuantity)
        self.medQuantityLabel.text = String(self.presentQuantity)
    }

    @IBOutlet weak var medQuantityLabel: UILabel!
    @IBOutlet weak var medNameLabel: UILabel!
    
    
}
