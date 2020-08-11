//
//  AddDoctorView.swift
//  HealthCare
//
//  Created by Phat Tran on 7/23/20.
//  Copyright © 2020 Phat Tran. All rights reserved.
//

import UIKit

class AddDoctorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Add Doctor"
        let rightBarButton = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(actionSaveDoctor))
        self.navigationItem.rightBarButtonItem = rightBarButton
    }
    
    @objc func actionSaveDoctor() {
        
    }
}
