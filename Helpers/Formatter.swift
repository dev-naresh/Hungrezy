//
//  Formatter.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 11/04/23.
//

import Foundation

class Formatter {
    static var coordinatesNumberFormatter: NumberFormatter = {
        var numberFormatter = NumberFormatter()
        numberFormatter.maximumFractionDigits = 15
        numberFormatter.allowsFloats = true
        return numberFormatter
    }()
    
    static var mobileNumberFormatter: NumberFormatter = {
        var numberFormatter = NumberFormatter()
        numberFormatter.minimum = 6000000000
        numberFormatter.maximum = 9999999999
        numberFormatter.allowsFloats = false
        return numberFormatter
    }()
    
    static var pinCodeFormatter: NumberFormatter = {
        var numberFormatter = NumberFormatter()
        numberFormatter.minimum = 100000
        numberFormatter.maximum = 999999
        numberFormatter.allowsFloats = false
        return numberFormatter
    }()
}
