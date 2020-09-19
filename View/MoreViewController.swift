//
//  ThirdViewController.swift
//  HealthCare
//
//  Created by Phat Tran on 7/16/20.
//  Copyright © 2020 Phat Tran. All rights reserved.
//

import UIKit

class MoreViewController: UIViewController {
    
    @IBOutlet weak var settingSupperView: UIView!
    @IBOutlet weak var helpSupperView: UIView!
    @IBOutlet weak var shareSupperView: UIView!
    @IBOutlet weak var rateSupperView: UIView!
    
    
    
    @IBAction func settingButton(_ sender: Any) {
        
    }
    
    @IBAction func helpButton(_ sender: Any) {
        
    }
    
    @IBAction func shareButton(_ sender: Any) {
        let text = "You want share Health Care to"
        let textToShare = [ text ]
        let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        activityViewController.excludedActivityTypes = [ UIActivity.ActivityType.airDrop, UIActivity.ActivityType.postToFacebook, UIActivity.ActivityType.postToTwitter, UIActivity.ActivityType.mail, UIActivity.ActivityType.assignToContact]
        self.present(activityViewController, animated: true, completion: nil)
    }
    
    @IBAction func rateButton(_ sender: Any) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customView()
        setColorNavigationBar()
    }
}

extension MoreViewController {
    
    func setColorNavigationBar() {
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 37/255, green: 63/255, blue: 90/255, alpha: 100)
        self.navigationController?.navigationBar.barStyle = .black
    }
    
    func customView() {
        
        let arrView: [UIView] = [settingSupperView, helpSupperView, shareSupperView, rateSupperView]
        for view in arrView {
            if view == settingSupperView {
                self.settingSupperView.layer.borderWidth = 1
                self.settingSupperView.layer.cornerRadius = 15
                self.settingSupperView.layer.borderColor = UIColor(red: 74/255, green: 74/255, blue: 74/255, alpha: 100).cgColor
            }
            if view == helpSupperView {
               self.helpSupperView.layer.borderWidth = 1
               self.helpSupperView.layer.cornerRadius = 15
               self.helpSupperView.layer.borderColor = UIColor(red: 74/255, green: 74/255, blue: 74/255, alpha: 100).cgColor
            }
            if view == shareSupperView {
               self.shareSupperView.layer.borderWidth = 1
               self.shareSupperView.layer.cornerRadius = 15
               self.shareSupperView.layer.borderColor = UIColor(red: 74/255, green: 74/255, blue: 74/255, alpha: 100).cgColor
            }
            if view == rateSupperView {
               self.rateSupperView.layer.borderWidth = 1
               self.rateSupperView.layer.cornerRadius = 15
               self.rateSupperView.layer.borderColor = UIColor(red: 74/255, green: 74/255, blue: 74/255, alpha: 100).cgColor
            }
        }
    }
}


