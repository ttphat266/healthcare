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
    
    @IBOutlet weak var medicineTableView: UITableView!
     
    override func viewDidLoad() {
        super.viewDidLoad()
        
        register()
        addMedicine()
        setColorNavigationBar()
    }
}

extension MedicationsViewController {

    func addMedicine() {
        let rightBarButton = UIBarButtonItem(barButtonSystemItem: .add,
                                             target: self,
                                             action: #selector(addMedicineAction))
        self.navigationItem.rightBarButtonItem = rightBarButton
    }
    
    @objc func addMedicineAction() {
        let addMedVC = AddMedicineViewController()
        self.navigationController?.pushViewController(addMedVC, animated: true)
    }
    
    func setColorNavigationBar() {
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 37/255, green: 63/255, blue: 90/255, alpha: 100)
        self.navigationController?.navigationBar.barStyle = .black
    }
}


    // Mark: TableView
extension MedicationsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func register() {
        self.medicineTableView.register(UINib(nibName: "MedicineCell", bundle: nil), forCellReuseIdentifier: "MedCellId")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = medicineTableView.dequeueReusableCell(withIdentifier: "MedCellId", for: indexPath) as! MedicineCell
        cell.medNameLabel?.text 
        
        return cell
    }
    
}
