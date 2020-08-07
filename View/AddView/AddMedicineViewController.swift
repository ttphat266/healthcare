//
//  AddPillViewController.swift
//  HealthCare
//
//  Created by Phat Tran on 7/23/20.
//  Copyright © 2020 Phat Tran. All rights reserved.
//

import UIKit

class AddMedicineViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton()
    }
}

extension AddMedicineViewController {
    
    @objc func saveMed(medModel: MedicineModel) {
       
    }

    func nextButton() {
        let rightBarButton = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(saveMed))
        self.navigationItem.rightBarButtonItem = rightBarButton
        let scheduleVC = ScheduleViewController()
        self.navigationController?.pushViewController(scheduleVC, animated: false)
    }
}


