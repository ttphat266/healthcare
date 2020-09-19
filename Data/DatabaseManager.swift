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
        
        let newRemind = ReminderItem()
        newRemind.reminderTittle = title
        newRemind.reminderDate = date
        newRemind.reminderNote = note
        newRemind.medList = list
        
        try! database.write {
            database.add(newRemind)
        }
    }
    
    func getReminder() -> [ReminderItem] {
        let results  = Array(database.objects(ReminderItem.self))
        for i in results {
            reminderList.append(i)
        }
        return results
    }
    
    func deleteReminder(remind: ReminderItem) {
        try! database.write {
            database.delete(remind)
        }
    }
    
    func deleteMedicine(list: List<MedicineItem>, index: Int) {
        try! database.write {
            database.delete(list[index])
        }
    }
    
    func addMedicine(newMedName: String, newMedQuantity: Int) {
        let newMed = MedicineItem()
        newMed.medName = newMedName
        newMed.medQuantity = Int(newMedQuantity)
        
        try! database.write {
            reminderList[0].medList.append(newMed)
        }
    }
    
    func updateMedicine(newMedName: String, newMedQuantity: Int, list: List<MedicineItem>, index: Int) {
        let newMed = MedicineItem()
        newMed.medName = newMedName
        newMed.medQuantity = Int(newMedQuantity)
        
        try! database.write {
            database.delete(list[index])
            reminderList[0].medList.insert(newMed, at: index)
        }
    }
}



 
