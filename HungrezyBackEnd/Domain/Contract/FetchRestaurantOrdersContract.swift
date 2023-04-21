//
//  FetchRestaurantOrdersContract.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 19/04/23.
//

import Foundation

protocol FetchRestaurantOrdersContract {
    func getOrders(restaurantID: String, success: @escaping ([Order]) -> Void, failure: @escaping (FetchRestaurantOrdersError) -> Void)
}
