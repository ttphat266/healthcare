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
    
    @IBOutlet weak var medTextField: UITextField!
    @IBOutlet weak var medCountTextField: UITextField!
    @IBOutlet weak var medTableView: UITableView!
    @IBAction func addMed(_ sender: UIButton) {
        let medText = medTextField.text!
        let countText = medCountTextField.text!
        if !medText.isEmpty && !countText.isEmpty {
            MedicineModel.shared.med.append(Medicine(medName: medText, medQuantity: Int(countText)!))
        }
        
        medTableView.reloadData()
        self.medTextField.text = ""
        self.medCountTextField.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MedicineModel.shared.medList = DatabaseManager.shareInstance.database.objects(RealmModel.self)
        
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
        return MedicineModel.shared.med.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = medTableView.dequeueReusableCell(withIdentifier: "MedCellID", for: indexPath) as! MedicineCell
        cell.medNameLabel.text = MedicineModel.shared.med[indexPath.row].medName
        cell.medQuantityLabel.text = String(MedicineModel.shared.med[indexPath.row].medQuantity)

        return cell
    }
    
//     Delete data:
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete{
            MedicineModel.shared.med.remove(at: indexPath.row)
            self.medTableView.beginUpdates()
            self.medTableView.deleteRows(at: [indexPath], with: .automatic)
            self.medTableView.endUpdates()
        }
    }
}


