//
//  Food.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 13/04/23.
//

import Foundation

struct Food: Codable, Hashable {
    var foodID: String
    var restaurantID: String
    var name: String
    var imageURL: String
    var description: String
    var cuisine: String
    var isVegetarian: Bool
    var price: Int
    var ratings: Float
    var ratingsCount: Int
}
