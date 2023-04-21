//
//  Restaurant.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 08/04/23.
//

import Foundation

struct Restaurant: Codable {
    let id: String
    var name: String
    var address: String
    var city: Location
    var latitude: Double
    var longitude: Double
    var pinCode: Int32
    var locality: String
    var openTime: Int32
    var closeTime: Int32
    var facilities: String
    var cuisines: String
    var averageCost: Int32
    var ratings: Float
    var contactNumber: Int64
    var diningType: DiningType
    var imageURL: String
}
