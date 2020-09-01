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
    
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var minuteLabel: UILabel!
    
    var timePicker = UIPickerView()
    var toolBar = UIToolbar()
    
    let hour = Array(0...23)
    let minute = Array(0...59)

    override func viewDidLoad() {
        super.viewDidLoad()
        doneAction()
        timePicker.delegate = self
        timePicker.dataSource = self
        
        
        
    }
    
    @IBAction func createTimePicker() {
         timePicker = UIPickerView.init()
         timePicker.delegate = self
         timePicker.backgroundColor = UIColor.black
         timePicker.setValue(UIColor.white, forKey: "textColor")
         timePicker.autoresizingMask = .flexibleLeftMargin
         timePicker.contentMode = .center
         timePicker.frame = CGRect.init(x: 0.0, y: UIScreen.main.bounds.size.height - 450, width: UIScreen.main.bounds.size.width, height: 450)
         self.view.addSubview(timePicker)

         toolBar = UIToolbar.init(frame: CGRect.init(x: 0.0, y: UIScreen.main.bounds.size.height - 400, width: UIScreen.main.bounds.size.width, height: 50))
         toolBar.barStyle = .blackTranslucent
         toolBar.items = [UIBarButtonItem.init(title: "Done", style: .done, target: self, action: #selector(onDoneButtonTapped))]
         self.view.addSubview(toolBar)
    }
    
    @objc func onDoneButtonTapped() {
        toolBar.removeFromSuperview()
        timePicker.removeFromSuperview()
    }
}
// PickerView Delegate
extension ScheduleViewController: UIPickerViewDelegate, UIPickerViewDataSource {

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {

        if component == 0 {
            return hour.count
        } else {
            return minute.count
        }
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if component == 0 {
            hourLabel.text = String(hour[row])
        } else {
            minuteLabel.text = String(minute[row])
        }
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return String(hour[row])
        } else {
            return String(minute[row])
        }
    }
}

extension ScheduleViewController  {
    func doneAction() {
        let rightBarButton = UIBarButtonItem(barButtonSystemItem: .done,
                                             target: self,
                                             action: #selector(isHiden))
        self.navigationItem.rightBarButtonItem = rightBarButton
    }
    
    @objc func isHiden() {
        self.navigationController?.popToRootViewController(animated: true)
    }
}

extension ScheduleViewController {
    
    
}
