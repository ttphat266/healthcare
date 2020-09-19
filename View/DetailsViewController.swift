//
//  DetailsViewController.swift
//  HealthCare
//
//  Created by Phat Tran on 9/15/20.
//  Copyright © 2020 Phat Tran. All rights reserved.
//

import UIKit
import RealmSwift

class DetailsViewController: UIViewController {
    
    var index: Int = 0
    var detailsList: List<MedicineItem>?
    
    @IBOutlet weak var detailsTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addButton()
        register()
        detailsList = DatabaseManager.shareInstance.getReminder()[index].medList
        setNavigationBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        detailsTableView.reloadData()
    }
       
        
    
}


extension DetailsViewController: UITableViewDelegate , UITableViewDataSource {
    func register() {
        self.detailsTableView.register(UINib(nibName: "DetailsCell", bundle: .main), forCellReuseIdentifier: "DetailsCellId")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return detailsList!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = detailsTableView.dequeueReusableCell(withIdentifier: "DetailsCellId", for: indexPath) as! DetailsCell
        cell.medNameLabel?.text = detailsList![indexPath.row].medName
        cell.medQuantity?.text = "\("Quantity: ")\(String(detailsList![indexPath.row].medQuantity))"
        return cell
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let editAction = UITableViewRowAction(style: .default, title: "Edit", handler: { (action, indexPath) in

            let editVc = EditMedicineViewController()
            self.navigationController?.pushViewController(editVc, animated: true)
            
        })
        

        let deleteAction = UITableViewRowAction(style: .default, title: "Delete", handler: { (action, indexPath) in
            DatabaseManager.shareInstance.deleteMedicine(list: self.detailsList!, index: indexPath.row)
            self.detailsTableView.reloadData()
        })
        
        editAction.backgroundColor = UIColor(red: 37/255, green: 63/255, blue: 90/255, alpha: 100)
        
        return [deleteAction, editAction]
    }
}

extension DetailsViewController {
    func addButton() {
        let rightBarButton = UIBarButtonItem(barButtonSystemItem: .add,
                                             target: self,
                                             action: #selector(addNewMedicine))
        self.navigationItem.rightBarButtonItem = rightBarButton
    }
    
    @objc func addNewMedicine() {
        let addMedVc = AddNewMedicineViewController()
        self.navigationController?.pushViewController(addMedVc, animated: true)
    }
    
    func setNavigationBar() {
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 37/255, green: 63/255, blue: 90/255, alpha: 100)
        self.navigationController?.navigationBar.barStyle = .black
        self.navigationItem.title = "Medication List"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
}
