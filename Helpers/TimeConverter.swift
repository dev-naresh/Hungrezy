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
}
