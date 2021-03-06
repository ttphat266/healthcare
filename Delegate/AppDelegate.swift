//
//  AppDelegate.swift
//  HealthCare
//
//  Created by Phat Tran on 7/14/20.
//  Copyright © 2020 Phat Tran. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var firstTabNavigationController : UINavigationController!
    var secondTabNavigationControoller : UINavigationController!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
       
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.backgroundColor = UIColor.black
        
        let tabBarController = UITabBarController()
        
        firstTabNavigationController   = UINavigationController.init(rootViewController: HomeViewController())
        
        secondTabNavigationControoller   = UINavigationController.init(rootViewController: MoreViewController())
        
        tabBarController.viewControllers = [firstTabNavigationController, secondTabNavigationControoller]
        
        let item1 = UITabBarItem(title: "Home",
                                 image: UIImage(named: "home-icon"),
                                 selectedImage: UIImage(named: "homefilled-icon"))

        let item3 = UITabBarItem(title: "More",
                                 image: UIImage(named: "more-icon"),
                                 selectedImage: UIImage(named: "morefilled-icon"))
        
        firstTabNavigationController.tabBarItem   = item1
        
        secondTabNavigationControoller.tabBarItem   = item3
        
        UITabBar.appearance().tintColor    = UIColor(red: 53/255.0, green: 116/255.0, blue: 135/255.0, alpha: 1.0)
        UITabBar.appearance().barTintColor = UIColor(red: 28/255.0, green: 28/255.0, blue: 30/255.0, alpha: 1.0)
        
        let layers = UIColor(red: 91/255.0, green: 198/255.0, blue: 235/255.0, alpha: 1.0)
        UITabBar.appearance().layer.borderWidth = 1
        UITabBar.appearance().layer.borderColor = layers.cgColor
        UITabBar.appearance().clipsToBounds     = true
        
        
        
        self.window?.rootViewController = tabBarController
               
        window?.makeKeyAndVisible()

        return true
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        completionHandler()
    }

    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .badge, .sound])
    }
    
}
