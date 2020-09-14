//
//  ScheduleViewController.swift
//  HealthCare
//
//  Created by Phat Tran on 7/27/20.
//  Copyright © 2020 Phat Tran. All rights reserved.
//

import UIKit
import UserNotifications
import RealmSwift

class ScheduleViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var tittleTextField: UITextField!
    @IBOutlet weak var timeTextField: UITextField!
    @IBOutlet weak var noteTextField: UITextField!
    @IBOutlet weak var datePickerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        doneButton()
    }
    
    @IBAction func tappedTextField() {
        self.datePickerView.isHidden = false
    }
}

    // Mark:   Set up doneAction
extension ScheduleViewController  {
    
    func doneButton() {
        let rightBarButton = UIBarButtonItem(barButtonSystemItem: .done,
                                             target: self,
                                             action: #selector(doneAction))
        self.navigationItem.rightBarButtonItem = rightBarButton
    }
    
    @objc func doneAction() {
        self.navigationController?.popViewController(animated: true)
        let tittle = tittleTextField!.text
        let note = noteTextField?.text
        let date = datePicker.date
        let medicinesList = AddMedicineViewController.draftList
        DatabaseManager.shareInstance.addData(title: tittle!, note: note!, date: date, medicines: medicinesList)
        self.navigationController?.popToRootViewController(animated: true)

//        print(Realm.Configuration.defaultConfiguration.fileURL)
    }
    
}

//extension ScheduleViewController: UITextFieldDelegate {
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        textField.resignFirstResponder()
//        return true
//    }
//}


