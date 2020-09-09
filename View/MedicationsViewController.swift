//
//  MedicationsViewController.swift
//  HealthCare
//
//  Created by Phat Tran on 7/31/20.
//  Copyright © 2020 Phat Tran. All rights reserved.
//

import UIKit
import RealmSwift


class MedicationsViewController: UIViewController {
    
    var reminderList: [Reminder] = []
    
    @IBOutlet weak var reminderTableView: UITableView!
     
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        self.reminderTableView.register(UINib(nibName: "ReminderCell", bundle: nil), forCellReuseIdentifier: "ReminderCellId")
        addButton()
        userButton()
        setColorNavigationBar()
    }
}

extension MedicationsViewController {
        
    @objc func addAction() {
        let alertController = UIAlertController(title: "Please choose one", message: "", preferredStyle: .actionSheet)
          
        let addMedAction = UIAlertAction(title: "Add a medicine", style: .default, handler: { (alert: UIAlertAction!) -> Void in
              let addMedlView = AddMedicineViewController()
              self.navigationController?.pushViewController(addMedlView, animated: true)
              print("added")
          })
        
        let addDoctorAction = UIAlertAction(title: "Add a doctor", style: .default, handler: { (alert: UIAlertAction!) -> Void in
            let addDoctorView = AddDoctorViewController()
            self.navigationController?.pushViewController(addDoctorView, animated: true)
            print("added")
        })
        
        let doneAction = UIAlertAction(title: "Done", style: .default, handler: { (alert: UIAlertAction!) -> Void in })
          
            alertController.addAction(addMedAction)
            alertController.addAction(addDoctorAction)  
            alertController.addAction(doneAction)
        
          self.present(alertController, animated: true, completion: nil)

    }
    
    @objc func userInfo() {
        print("user")
    }

    func addButton() {
        let rightBarButton = UIBarButtonItem(barButtonSystemItem: .add,
                                             target: self,
                                             action: #selector(addAction))
        self.navigationItem.rightBarButtonItem = rightBarButton
    }
    
    func userButton() {
        let userLeftBarButton = UIBarButtonItem(image: UIImage(named: "user"),
                                                style: .plain,
                                                target: self,
                                                action: #selector(userInfo))
        let leftItem = UIBarButtonItem(title: "User",
                                       style: .plain,
                                       target: self,
                                       action: nil)
        self.navigationItem.leftBarButtonItem = leftItem
        self.navigationItem.leftBarButtonItem = userLeftBarButton
    }
    
    func setColorNavigationBar() {
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 37/255, green: 63/255, blue: 90/255, alpha: 100)
        self.navigationController?.navigationBar.barStyle = .black
    }
}


    // Mark: TableView
extension MedicationsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reminderList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = reminderTableView.dequeueReusableCell(withIdentifier: "ReminderCellId", for: indexPath) as! ReminderCell
        cell.titleLabel?.text = Reminder.shared.reminderList[indexPath.row].title
        let date = Reminder.shared.reminderList[indexPath.row].date

        let formatter = DateFormatter()
        formatter.dateFormat = "MMM, dd, YYYY"
        cell.timeLabel?.text = formatter.string(from: date)
        
        return cell
    }
    
    
}
