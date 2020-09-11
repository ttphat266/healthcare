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
    
    var draftTable: [MedicineItem] = []
    
    @IBOutlet weak var medTextField: UITextField!
    @IBOutlet weak var medCountTextField: UITextField!
    @IBOutlet weak var medTableView: UITableView!
    
    @IBAction func addMed(_ sender: UIButton) {
        let newMed = MedicineItem()
        newMed.medName = medTextField.text!
        newMed.medQuantity = Int(medCountTextField.text!)!
        
        if newMed.medName.isEmpty {
            draftTable.append(newMed)
        }
        
        medTableView.reloadData()
        self.medTextField.text = ""
        self.medCountTextField.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        register()
        nextTapped()
        hideKeyboardWhenTappedAround()
    }
    
}

extension AddMedicineViewController {
    
    func nextTapped() {
        let rightBarButton = UIBarButtonItem(title: "Next",
                                             style: .plain,
                                             target: self,
                                             action: #selector(nextButton))
        self.navigationItem.rightBarButtonItem = rightBarButton
    }
    
    @objc func nextButton() {
        let scheduleVC = ScheduleViewController()
        self.navigationController?.pushViewController(scheduleVC, animated: false)
    }
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self,
                                                                 action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}


extension AddMedicineViewController: UITableViewDelegate, UITableViewDataSource {
    
    func register() {
        self.medTableView.register(UINib(nibName: "MedicineCell", bundle: Bundle.main), forCellReuseIdentifier: "MedCellID")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return draftTable.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = medTableView.dequeueReusableCell(withIdentifier: "MedCellID", for: indexPath) as! MedicineCell
        cell.medNameLabel.text = draftTable[indexPath.row].medName
        cell.medQuantityLabel.text = String(draftTable[indexPath.row].medQuantity)

        return cell
    }
    
//     Delete data:
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete{
            draftTable.remove(at: indexPath.row)
            self.medTableView.beginUpdates()
            self.medTableView.deleteRows(at: [indexPath], with: .automatic)
            self.medTableView.endUpdates()
        }
    }
}


