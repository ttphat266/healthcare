//
//  EditMedicineViewController.swift
//  HealthCare
//
//  Created by Phat Tran on 9/18/20.
//  Copyright © 2020 Phat Tran. All rights reserved.
//

import UIKit
import RealmSwift

class EditMedicineViewController: UIViewController {
    
    @IBOutlet weak var titteSupperView: UIView!
    @IBOutlet weak var quantitySuperView: UIView!
    
    @IBOutlet weak var updateNameTextField: UITextField!
    @IBOutlet weak var updateQuantityTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        upDate()
        setNavigationBar()
        customView()
        hideKeyboardWhenTappedAround()
    }
}

extension EditMedicineViewController {
     func upDate() {
        let rightBarButton = UIBarButtonItem(title: "Update", style: .done, target: self, action: #selector(updateMed))
         self.navigationItem.rightBarButtonItem = rightBarButton
     }
    
    @objc func updateMed() {
        
        let index: Int = 0
        let list = DatabaseManager.shareInstance.getReminder()[index].medList
        
        DatabaseManager.shareInstance.updateMedicine(newMedName: updateNameTextField.text!, newMedQuantity: Int(updateQuantityTextField.text!)!, list: list , index: index )
        self.navigationController?.popViewController(animated: true)
    }
    
    func setNavigationBar() {
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 37/255, green: 63/255, blue: 90/255, alpha: 100)
        self.navigationController?.navigationBar.barStyle = .black
        self.navigationItem.title = "Edid Medicine"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
    func customView() {
        let arrView: [UIView] = [titteSupperView, quantitySuperView]
        for view in arrView {
            if view == titteSupperView {
               self.titteSupperView.layer.borderWidth = 1
               self.titteSupperView.layer.cornerRadius = 15
               self.titteSupperView.layer.borderColor = UIColor(red: 74/255, green: 74/255, blue: 74/255, alpha: 100).cgColor
            }
            if view == quantitySuperView {
               self.quantitySuperView.layer.borderWidth = 1
               self.quantitySuperView.layer.cornerRadius = 15
               self.quantitySuperView.layer.borderColor = UIColor(red: 74/255, green: 74/255, blue: 74/255, alpha: 100).cgColor
            }
        }
    }
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self,action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
