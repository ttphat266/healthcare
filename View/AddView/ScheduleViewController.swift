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

    @IBOutlet weak var tittleTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var noteTextField: UITextField!
    
    @IBOutlet weak var tittleSuperView: UIView!
    @IBOutlet weak var dateSuperView: UIView!
    @IBOutlet weak var noteSuperView: UIView!
    
    let datePicker = UIDatePicker()
    
    let userNotificationCenter = UNUserNotificationCenter.current()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateTextField.inputView = datePicker
        datePicker.datePickerMode = .time
        datePicker.backgroundColor = UIColor(red: 34/255, green: 33/255, blue: 35/255, alpha: 100)
        datePicker.setValue(UIColor(red: 36/255, green: 141/255, blue: 250/255, alpha: 100), forKeyPath: "textColor")
        datePicker.setValue(0.8, forKeyPath: "alpha")
        
        let toolBar = UIToolbar()
        toolBar.barTintColor = UIColor(red: 54/255, green: 72/255, blue: 93/255, alpha: 100)
        toolBar.sizeToFit()
        
        let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancel = UIBarButtonItem(title: "Cancel", style: .plain, target: nil, action: #selector(tapCancel))
        let barButton = UIBarButtonItem(title: "Done", style: .plain, target: target, action: #selector(doneAction))
        
        toolBar.setItems([cancel, flexible, barButton], animated: true)
        dateTextField.inputAccessoryView = toolBar
        
        tittleTextField.delegate = self
        noteTextField.delegate = self
      
    
        setNavigationBar()
        doneButton()
        setNavigationBar()
        setPlaceHolderTextFieldColor()
        customView()
        hideKeyboardWhenTappedAround() 
    }
    
    @objc func tapCancel() {
        dateTextField.resignFirstResponder()
    }
    
    @objc func doneAction() {
        getDateFromDatePicker()
        view.endEditing(true )
    }
    
    func getDateFromDatePicker() {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, h:mm a"
        dateTextField.text = formatter.string(from: datePicker.date)
    }
}

extension ScheduleViewController  {
    func doneButton() {
        let rightBarButton = UIBarButtonItem(barButtonSystemItem: .done,
                                             target: self,
                                             action: #selector(saveReminderAction))
        self.navigationItem.rightBarButtonItem = rightBarButton
    }
    
    @objc func saveReminderAction() {
        self.navigationController?.popViewController(animated: true)
        
        let tittle = tittleTextField!.text
        let note = noteTextField!.text
        let date = datePicker.date
        
        let medicinesList = AddMedicineViewController.draftList
        
        DatabaseManager.shareInstance.addData(title: tittle!,
                                              note: note!,
                                              date: date,
                                              medicines: medicinesList)
        self.navigationController?.popToRootViewController(animated: true)
        
        
        AddMedicineViewController.draftList.removeAll()
        
          
        self.requestNotificationAuthorization()
        self.sendNotification()
        print(DatabaseManager.shareInstance.reminderList)
    }
}

extension ScheduleViewController: UITextFieldDelegate {

    func textFieldDidBeginEditing(_ textField: UITextField) {
        if tittleTextField.isFirstResponder == true {
            tittleTextField.placeholder = nil
        }
        if noteTextField.isFirstResponder == true {
            noteTextField.placeholder = nil
        }
    }
}

extension ScheduleViewController {
    func requestNotificationAuthorization() {
        let authOptions = UNAuthorizationOptions.init(arrayLiteral: .alert, .badge, .sound)
        self.userNotificationCenter.requestAuthorization(options: authOptions) { (success, error) in
            if let error = error {
                print("Error: ", error)
            }
        }
    }
    
    func sendNotification() {
        let notificationContent = UNMutableNotificationContent()
        notificationContent.title = "Hi guys"
        notificationContent.subtitle = "It's time"
        notificationContent.body = "Please take your medicines"
        notificationContent.badge = NSNumber(value: 3)
        
        if let url = Bundle.main.url(forResource: "dune",
                                    withExtension: "png") {
            if let attachment = try? UNNotificationAttachment(identifier: "dune",
                                                            url: url,
                                                            options: nil) {
                notificationContent.attachments = [attachment]
            }
        }
        
        let dateComponent = datePicker.calendar.dateComponents([.day, .hour, .minute], from: datePicker.date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: false)

        let request = UNNotificationRequest(identifier: "testNotification",
                                            content: notificationContent,
                                            trigger: trigger)
        
        userNotificationCenter.add(request) { (error) in
            if let error = error {
                print("Notification Error: ", error)
            }
        }
    }
}

extension ScheduleViewController {
    func setNavigationBar() {
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 37/255, green: 63/255, blue: 90/255, alpha: 100)
        self.navigationController?.navigationBar.barStyle = .black
        self.navigationItem.title = "Schedule"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
    func setPlaceHolderTextFieldColor() {
        tittleTextField.attributedPlaceholder = NSAttributedString(string: "Tittle ", attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 132/255, green: 132/255, blue: 132/255, alpha: 100)])
        noteTextField.attributedPlaceholder = NSAttributedString(string: "Something Note", attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 132/255, green: 132/255, blue: 132/255, alpha: 100)])
    }
    
    func customView() {
        let arrView: [UIView] = [tittleSuperView, dateSuperView, noteSuperView]
        for view in arrView {
            if view == tittleSuperView {
                self.tittleSuperView.layer.borderWidth = 1
                self.tittleSuperView.layer.cornerRadius = 15
                self.tittleSuperView.layer.borderColor = UIColor(red: 74/255, green: 74/255, blue: 74/255, alpha: 100).cgColor
            }
            if view == dateSuperView {
               self.dateSuperView.layer.borderWidth = 1
               self.dateSuperView.layer.cornerRadius = 15
               self.dateSuperView.layer.borderColor = UIColor(red: 74/255, green: 74/255, blue: 74/255, alpha: 100).cgColor
            }
            if view == noteSuperView {
               self.noteSuperView.layer.borderWidth = 1
               self.noteSuperView.layer.cornerRadius = 15
               self.noteSuperView.layer.borderColor = UIColor(red: 74/255, green: 74/255, blue: 74/255, alpha: 100).cgColor
            }
        }
    }
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

