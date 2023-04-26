//
//  Order.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 19/04/23.
//

import Foundation

struct Order: Codable, Hashable {
    var orderID: String
    var userID: String
    var restaurantID: String
    var foodIDs: [String]
    var quantities: [Int]
    var cartTotal: Int
    var gst: Int
    var packingFee: Int
    var deliveryFee: Int
    var grandTotal: Int
    var orderDate: Int64
    var deliveryAddress: String
    var customerMobileNumber: Int64
}
