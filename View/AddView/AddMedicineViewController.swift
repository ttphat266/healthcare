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
    
    var medList: [String] = []
    
    @IBOutlet weak var medTextField: UITextField!
    @IBOutlet weak var medTableView: UITableView!
    @IBAction func addMed(_ sender: UIButton) {
        let medText = medTextField.text!
        if medText.isEmpty == false {
            medList.append(medText)
        }
        medTextField.text = nil
        print()
        
        medTableView.reloadData()
    }
        
        
    
//        DatabaseManager.shareInstance.addData(table: medTableView,text: medTextField)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.medTableView.register(UINib(nibName: "MedicineCell", bundle: Bundle.main), forCellReuseIdentifier: "MedCellID")
        let rightBarButton = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(nextButton))
               self.navigationItem.rightBarButtonItem = rightBarButton
               
//        medList = DatabaseManager.shareInstance.database.objects(MedicineModel.self)
        
        hideKeyboardWhenTappedAround()
    }
    
}

extension AddMedicineViewController {
    
    @objc func nextButton() {
        let scheduleVC = ScheduleViewController()
        self.navigationController?.pushViewController(scheduleVC, animated: false)
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


extension AddMedicineViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        medList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = medTableView.dequeueReusableCell(withIdentifier: "MedCellID", for: indexPath) as! MedicineCell
        cell.medNameLabel.text = medList[indexPath.row]
        return cell
    }
    
    // Delete data:
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == UITableViewCell.EditingStyle.delete{
//            if let medItem = medList[indexPath.row] {
//                try! DatabaseManager.shareInstance.database.write {
//                    DatabaseManager.shareInstance.database.delete(medItem)
//                }
//                medTableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
//            }
//        }
//    }
}


