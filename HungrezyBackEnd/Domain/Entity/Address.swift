//
//  Address.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 08/04/23.
//

import Foundation

struct Address : Codable {
    var doorNumber: String
    var addressLine1: String
    var addressLine2: String
    var city: Location
    var pinCode: Int
}
