//
//  AddDoctorView.swift
//  HealthCare
//
//  Created by Phat Tran on 7/23/20.
//  Copyright © 2020 Phat Tran. All rights reserved.
//

import UIKit

class AddDoctorViewController: UIViewController {
    
    var doctorList: [DoctorModel] = []
    
    @IBOutlet weak var doctorNameTextField: UITextField!
    @IBOutlet weak var doctorEmailTextField: UITextField!
    @IBOutlet weak var mobileTextField: UITextField!
    @IBOutlet weak var officeTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Add Doctor"
        let rightBarButton = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(actionSaveDoctor))
        self.navigationItem.rightBarButtonItem = rightBarButton
    }
    
    @objc func actionSaveDoctor() {
        
    }
    
}
