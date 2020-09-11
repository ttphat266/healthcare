//
//  Medicine.swift
//  HealthCare
//
//  Created by Phat Tran on 7/16/20.
//  Copyright © 2020 Phat Tran. All rights reserved.
//

import UIKit
import RealmSwift

class ReminderItem: Object {
    
    static var sharedInstance = ReminderItem()
    
    @objc dynamic var reminderId: Int = 0
    @objc dynamic var reminderTittle: String = ""
    @objc dynamic var date = Date()
    @objc dynamic var note: String = ""
    @objc dynamic var doctorId: Int = 0
    
    var medList = List<MedicineItem>()
    
    override class func primaryKey() -> String {
        return "reminderId"
    }
}

class MedicineItem: Object {
    
    @objc dynamic var medId: Int = 0
    @objc dynamic var medName: String = ""
    @objc dynamic var medQuantity: Int = 0
    
    override class func primaryKey() -> String {
        return "medId"
    }
}

class DatabaseManager {
    
    let database = try! Realm()
    
    static let shareInstance = DatabaseManager()

    
    func addData(title: String, note: String, date: Date) {
        
        let reminder = ReminderItem()
        reminder.reminderTittle = title
        reminder.note = note
        reminder.date = date
        
        try! database.write {
            database.add(reminder)
        }
    }
    
    func queryData(completion: (Bool) -> ()) {
        do {
            // results
            let results = database.objects(ReminderItem.self)
            
            // convert to array
            _ = Array(results)
            
            // call back
            completion(true)
            
        } catch {
            // call back
            completion(false)
        }
    }
}


