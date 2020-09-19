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
        
    static var draftList: [MedicineItem] = []
    
    @IBOutlet weak var medTextField: UITextField!
    @IBOutlet weak var medCountTextField: UITextField!
    @IBOutlet weak var medTableView: UITableView!
    
    @IBOutlet weak var medNameSupperView: UIView!
    @IBOutlet weak var medQuantitySupperView: UIView!
    @IBOutlet weak var addButtonSupperView: UIView!
    
    @IBAction func addMed(_ sender: UIButton) {
        let newMed = MedicineItem()
        newMed.medName = medTextField.text!
        newMed.medQuantity = Int(medCountTextField.text!)!
        AddMedicineViewController.draftList.append(newMed)
        medTableView.reloadData()
        self.medTextField.text = ""
        self.medCountTextField.text = ""
        setPlaceHolderTextFieldColor()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        medTextField.delegate = self
        medCountTextField.delegate = self
        
        register()
        saveMed()
        hideKeyboardWhenTappedAround()
        setNavigationBar()
        setPlaceHolderTextFieldColor()
        customView()
    }
    
}

extension AddMedicineViewController {
    
    func saveMed() {
        let rightBarButton = UIBarButtonItem(title: "Next",
                                             style: .plain,
                                             target: self,
                                             action: #selector(saveAction))
        self.navigationItem.rightBarButtonItem = rightBarButton
    }
    
    @objc func saveAction() {
        let scheduleVC = ScheduleViewController()
        self.navigationController?.pushViewController(scheduleVC, animated: true)
        
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
    
    func setNavigationBar() {
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 37/255, green: 63/255, blue: 90/255, alpha: 100)
        self.navigationController?.navigationBar.barStyle = .black
        self.navigationItem.title = "Add Medicine"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
    func setPlaceHolderTextFieldColor() {
        medTextField.attributedPlaceholder = NSAttributedString(string: "Medication Name", attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 132/255, green: 132/255, blue: 132/255, alpha: 100)])
        medCountTextField.attributedPlaceholder = NSAttributedString(string: "Medication Quantity", attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 132/255, green: 132/255, blue: 132/255, alpha: 100)])
    }
}


extension AddMedicineViewController: UITableViewDelegate, UITableViewDataSource {
    func register() {
        self.medTableView.register(UINib(nibName: "MedicineCell", bundle: Bundle.main), forCellReuseIdentifier: "MedCellId")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AddMedicineViewController.draftList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = medTableView.dequeueReusableCell(withIdentifier: "MedCellId", for: indexPath) as! MedicineCell
        cell.medNameLabel.text = AddMedicineViewController.draftList[indexPath.row].medName
        cell.medQuantityLabel.text = String(AddMedicineViewController.draftList[indexPath.row].medQuantity)
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete{
            AddMedicineViewController.draftList.remove(at: indexPath.row)
            self.medTableView.beginUpdates()
            self.medTableView.deleteRows(at: [indexPath], with: .automatic)
            self.medTableView.endUpdates()
        }
    }
}

extension AddMedicineViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if medTextField.isFirstResponder == true {
            medTextField.placeholder = nil
        }
        if medCountTextField.isFirstResponder == true {
            medCountTextField.placeholder = nil
        }
    }
}

extension AddMedicineViewController {
    func customView() {
        let arrView: [UIView] = [medNameSupperView, medQuantitySupperView, addButtonSupperView]
        for view in arrView {
            if view == medNameSupperView {
                self.medNameSupperView.layer.borderWidth = 1
                self.medNameSupperView.layer.cornerRadius = 15
                self.medNameSupperView.layer.borderColor = UIColor(red: 74/255, green: 74/255, blue: 74/255, alpha: 100).cgColor
            }
            if view == medQuantitySupperView {
               self.medQuantitySupperView.layer.borderWidth = 1
               self.medQuantitySupperView.layer.cornerRadius = 15
               self.medQuantitySupperView.layer.borderColor = UIColor(red: 74/255, green: 74/255, blue: 74/255, alpha: 100).cgColor
            }
            if view == addButtonSupperView {
               self.addButtonSupperView.layer.borderWidth = 1
               self.addButtonSupperView.layer.cornerRadius = 15
               self.addButtonSupperView.layer.borderColor = UIColor(red: 74/255, green: 74/255, blue: 74/255, alpha: 100).cgColor
            }
        }
    }
}


