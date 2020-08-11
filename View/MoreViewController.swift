//
//  ThirdViewController.swift
//  HealthCare
//
//  Created by Phat Tran on 7/16/20.
//  Copyright © 2020 Phat Tran. All rights reserved.
//

import UIKit

class MoreViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addButton()
        userButton()
        setColorNavigationBar()
    }
}

extension MoreViewController {
        
    @objc func addAction() {
        let alertController = UIAlertController(title: "Please choose one", message: "", preferredStyle: .actionSheet)
          
        let addMedAction = UIAlertAction(title: "Add a medicine", style: .default, handler: { (alert: UIAlertAction!) -> Void in
              let addMedlView = AddMedicineViewController()
              self.navigationController?.pushViewController(addMedlView, animated: true)
              print("added")
          })
        let addDoctorAction = UIAlertAction(title: "Add a doctor", style: .default, handler: { (alert: UIAlertAction!) -> Void in
            let addDoctorView = AddDoctorViewController()
            self.navigationController?.pushViewController(addDoctorView, animated: true)
            print("added")
        })
        let addDependentAction = UIAlertAction(title: "Add a dependent", style: .default, handler: { (alert: UIAlertAction!) -> Void in
            let addDependentView = AddDependentViewController()
            self.navigationController?.pushViewController(addDependentView, animated: true)
            print("added")
        })
        let doneAction = UIAlertAction(title: "Done", style: .default, handler: { (alert: UIAlertAction!) -> Void in })
          
            alertController.addAction(addMedAction)
            alertController.addAction(addDoctorAction)
            alertController.addAction(addDependentAction)
            alertController.addAction(doneAction)
        
          self.present(alertController, animated: true, completion: nil)

    }
    
    @objc func userInfo() {
        print("user")
    }

    func addButton() {
        let rightBarButton = UIBarButtonItem(barButtonSystemItem: .add,
                                             target: self,
                                             action: #selector(addAction))
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
