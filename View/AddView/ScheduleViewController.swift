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
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var timeTextField: UITextField!
    @IBOutlet weak var noteTextField: UITextField!
    @IBOutlet weak var datePickerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        doneAction()
    }
    
    @IBAction func tappedTextField() {
        self.datePickerView.isHidden = false
    }
}

    // Mark:   Set up doneAction
extension ScheduleViewController  {
    
    func doneAction() {
        let rightBarButton = UIBarButtonItem(barButtonSystemItem: .done,
                                             target: self,
                                             action: #selector(isHiden))
        self.navigationItem.rightBarButtonItem = rightBarButton
    }
    
    @objc func isHiden() {
        
    }
    
//    
}

//extension ScheduleViewController: UITextFieldDelegate {
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        textField.resignFirstResponder()
//        return true
//    }
//}


