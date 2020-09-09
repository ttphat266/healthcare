//
//  Database.swift
//  HealthCare
//
//  Created by Phat Tran on 8/8/20.
//  Copyright © 2020 Phat Tran. All rights reserved.
//

import Foundation
import RealmSwift

class DatabaseManager {
    
    let database = try! Realm()
    
    static let shareInstance = DatabaseManager()
    
    func addData(table: UITableView ,text: UITextField) {
        if text.text!.isEmpty {
        } else {
            let newObject = RealmModel()
            newObject.Name = text.text!
            
            try! database.write {
                database.add(newObject)
            }
            print(database.objects(RealmModel.self))
            text.text = ""
            table.reloadData()
        }
    }
}



 
