//
//  AddPillViewController.swift
//  HealthCare
//
//  Created by Phat Tran on 7/23/20.
//  Copyright © 2020 Phat Tran. All rights reserved.
//

import UIKit
import RealmSwift

class AddMedicineViewController: UIViewController {
    
    @IBOutlet weak var medNameTextField: UITextField!

    let realm = try! Realm()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        render()
        saveMed()
    }
    
    func render() {
        let med = realm.objects(MedicineModel.self)
        for medicine in med {
            
            let medicineName = medicine.medName
            let medicineId = medicine.medId
            
            
            print("\(medicineId) \(medicineName)")
        }
    }
    
    
}

extension AddMedicineViewController {
    
    @objc func saveMed() {
       let medicine = MedicineModel()
       medicine.medId = 1
       medicine.medName = "Panadol"
       
       try! realm.write {
           realm.add(medicine)
       }
       print(Realm.Configuration.defaultConfiguration.fileURL!)
       
       let medResult = realm.objects(MedicineModel.self)
        
       print(medResult)
    }

    func nextButton() {
        let rightBarButton = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(saveMed))
        self.navigationItem.rightBarButtonItem = rightBarButton
         
        let scheduleVC = ScheduleViewController()
        self.navigationController?.pushViewController(scheduleVC, animated: false)
    }
}


