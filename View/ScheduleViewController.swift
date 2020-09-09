//
//  ScheduleViewController.swift
//  HealthCare
//
//  Created by Phat Tran on 7/27/20.
//  Copyright © 2020 Phat Tran. All rights reserved.
//

import UIKit
import UserNotifications

class ScheduleViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var timeTextField: UITextField!
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
        addDataToRealm()
        didTappedDone()
    }
    
    func didTappedDone() {
        if let titleText = titleTextField.text, !titleText.isEmpty,
            let timeText = timeTextField.text, !timeText.isEmpty {
            let targetDate = datePicker.date
            MedicationsViewController.completion!(titleText, targetDate)
        }
        
        // Mark Set notification:
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound], completionHandler: { success, error in
            if success {
                self.reminderContent()
            }
            else if error != nil {
                print("error")
            }
        })
    }
    
    // Mar Content Notification:
    func reminderContent() {
        MedicationsViewController.completion = { title, date in
           DispatchQueue.main.async {
                self.navigationController?.popToRootViewController(animated: true)
                let new = ReminderModel()
                Reminder.shared.reminderList.append(new)

                let content = UNMutableNotificationContent()
                content.title = title
                content.sound = .default

                let targetDate = date
                let trigger = UNCalendarNotificationTrigger(dateMatching: Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: targetDate),repeats: false)

                let request = UNNotificationRequest(identifier: "some_long_id", content: content, trigger: trigger)
                UNUserNotificationCenter.current().add(request, withCompletionHandler: { error in
                    if error != nil {
                        print("something went wrong")
                    }
                })
            }
        }
    }
    
    // Creat Realm Data:
    func addDataToRealm() {
        for i in 0...MedicineModel.shared.med.count - 1 {
            let object = RealmModel()
            object.Name = MedicineModel.shared.med[i].medName
            object.Quantity = MedicineModel.shared.med[i].medQuantity
            try! MedicineModel.shared.realm.write({
                MedicineModel.shared.realm.add(object)
            })
        }
        print(MedicineModel.shared.realm.objects(RealmModel.self))
    }
}

extension ScheduleViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}


