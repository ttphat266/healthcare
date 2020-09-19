//
//  FirstViewController.swift
//  HealthCare
//
//  Created by Phat Tran on 7/21/20.
//  Copyright © 2020 Phat Tran. All rights reserved.
//

import UIKit
import FSCalendar
import RealmSwift

class HomeViewController: UIViewController {
    
    @IBOutlet weak var reminderTableView: UITableView!
    
    fileprivate weak var calendar: FSCalendar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        register()
        addButton()
        setNavigationBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        reminderTableView.reloadData()
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
        let addMedVC = AddMedicineViewController()
        self.navigationController?.pushViewController(addMedVC, animated: true)
    }
    
    
    func setNavigationBar() {
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 37/255, green: 63/255, blue: 90/255, alpha: 100)
        self.navigationController?.navigationBar.barStyle = .black
    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func register() {
        self.reminderTableView.register(UINib(nibName: "ReminderCell", bundle: Bundle.main), forCellReuseIdentifier: "ReminderCellId")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DatabaseManager.shareInstance.getReminder().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = reminderTableView.dequeueReusableCell(withIdentifier: "ReminderCellId", for: indexPath) as! ReminderCell
        let item = DatabaseManager.shareInstance.reminderList[indexPath.row]

        cell.titleLabel?.text = "\("Medicine name: ") \(item.reminderTittle)"
        cell.noteLabel?.text = "\("Note: ") \(item.reminderNote)"
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, h:mm a"

        let timeInDB: Date = item.reminderDate
        cell.timeLabel?.text = "Time: \(dateFormatter.string(from: timeInDB))"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVc = DetailsViewController()
        detailVc.index = indexPath.row
        self.navigationController?.pushViewController(detailVc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            let remind = DatabaseManager.shareInstance.getReminder() [indexPath.row]
            DatabaseManager.shareInstance.deleteReminder(remind: remind)
            self.reminderTableView.deleteRows(at: [indexPath], with: .automatic)
            self.reminderTableView.reloadData()
            print(DatabaseManager.shareInstance.getReminder())
        }
    }
}

