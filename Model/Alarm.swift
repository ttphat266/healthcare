//
//  Alarm.swift
//  HealthCare
//
//  Created by Phat Tran on 8/29/20.
//  Copyright © 2020 Phat Tran. All rights reserved.
//

import Foundation

struct Alarm {
    var date: Date = Date()
    var enabled: Bool = false
    var repeatWeekdays: [Int] = []
    var uuid: String = ""
    var label: String = "Alarm"

    init(){}

    init(date:Date, enabled:Bool, snoozeEnabled:Bool, repeatWeekdays:[Int], uuid:String, mediaID:String, mediaLabel:String, label:String, onSnooze: Bool){
        self.date = date
        self.enabled = enabled
        self.repeatWeekdays = repeatWeekdays
        self.uuid = uuid
        self.label = label
    }
}

extension Alarm {
    var formattedTime: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mm"
        return dateFormatter.string(from: self.date)
    }
}
