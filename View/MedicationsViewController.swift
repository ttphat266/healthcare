//
//  MedicationsViewController.swift
//  HealthCare
//
//  Created by Phat Tran on 7/31/20.
//  Copyright © 2020 Phat Tran. All rights reserved.
//

import UIKit

class MedicationsViewController: UIViewController {
     
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addButton()
        userButton()
        setColorNavigationBar()
    }
}

extension MedicationsViewController {
        
    @objc func addMedication() {
        let addMedlView = AddMedicineViewController()
        self.navigationController?.pushViewController(addMedlView, animated: true)
        print("added")
    }
    
    @objc func userInfo() {
        print("user")
    }

    func addButton() {
        let rightBarButton = UIBarButtonItem(barButtonSystemItem: .add,
                                             target: self,
                                             action: #selector(addMedication))
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
