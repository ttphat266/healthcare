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
        
        
        setColorNavigationBar()
    }
}

extension MoreViewController {
    
    func setColorNavigationBar() {
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 37/255, green: 63/255, blue: 90/255, alpha: 100)
        self.navigationController?.navigationBar.barStyle = .black
    }
}
