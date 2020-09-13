//
//  FirstViewController.swift
//  HealthCare
//
//  Created by Phat Tran on 7/21/20.
//  Copyright © 2020 Phat Tran. All rights reserved.
//

import UIKit
import FSCalendar

class HomeViewController: UIViewController {
    
    @IBOutlet weak var reminderTableView: UITableView!
    
    fileprivate weak var calendar: FSCalendar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        register()
        addButton()
        setColorNavigationBar()
    }
}

extension HomeViewController {
        
    func addButton() {
        let rightBarButton = UIBarButtonItem(barButtonSystemItem: .add,
                                             target: self,
                                             action: #selector(addReminder))
        self.navigationItem.rightBarButtonItem = rightBarButton
    }
    
    @objc func addReminder() {
        let scheduleVC = ScheduleViewController()
        self.navigationController?.pushViewController(scheduleVC, animated: true)
    }
    
    
    func setColorNavigationBar() {
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 37/255, green: 63/255, blue: 90/255, alpha: 100)
        self.navigationController?.navigationBar.barStyle = .black
    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func register() {
        self.reminderTableView.register(UINib(nibName: "ReminderCell", bundle: Bundle.main), forCellReuseIdentifier: "ReminderCellId")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DatabaseManager.shareInstance.reminderList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = reminderTableView.dequeueReusableCell(withIdentifier: "ReminderCellId", for: indexPath) as! ReminderCell
        cell.titleLabel?.text = DatabaseManager.shareInstance.reminderList[indexPath.row].reminderTittle
        cell.noteLabel?.text = DatabaseManager.shareInstance.reminderList[indexPath.row].reminderNote
        
        return cell
    }
    
    
}

