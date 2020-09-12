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

    let reminderList = List<ReminderItem>()

    func addData(title: String, note: String, date: Date, medicines: [MedicineItem]) {

        let list = List<MedicineItem>()
        medicines.forEach { list.append($0) }
        
        let remind = ReminderItem()
        remind.reminderTittle = title
        remind.reminderDate = date
        remind.reminderNote = note
        remind.medList = list
        
        try! database.write {
            database.add(remind)
        }
    }
    
    
}



 
