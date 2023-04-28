//
//  OrderStatus.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 26/04/23.
//

import Foundation

enum OrderStatus: String, Codable {
    case Ordered = "Ordered"
    case Processed = "Processed"
    case Preparing = "Preparing"
    case Delivered = "Delivered"
    case Cancelled = "Cancelled"
}
