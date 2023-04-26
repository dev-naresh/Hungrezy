//
//  TimeConverter.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 11/04/23.
//

import Foundation

class TimeConverter {
    static func intToTime(_ minute: Int) -> Date {
        return Date(timeIntervalSinceReferenceDate: TimeInterval(minute))
    }

    static func timeToInt(_ date: Date) -> Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.hour, .minute], from: date)
        print(components.hour!, components.minute!)
        return components.hour! * 60 + components.minute!
    }
    
    static func dateToInt64(_ date: NSDate) -> Int64 {
        return Int64(date.timeIntervalSince1970)
    }
    
    static func int64ToDate(timestamp: Int64) -> NSDate {
        return NSDate(timeIntervalSince1970: TimeInterval(timestamp))
    }
}
