//
//  RestaurantDataDatabaseContract.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 09/04/23.
//

import Foundation

protocol RestaurantDataDatabaseContract {
    func createRestaurantTable(success: @escaping (String) -> Void, failure: @escaping (String) -> Void)
    func insertIntoRestaurantTable(restaurant: Restaurant, success: @escaping (Restaurant) -> Void, failure: @escaping (String) -> Void)
    func fetchRestaurants(filters: [String], success: @escaping ([Restaurant]) -> Void, failure: @escaping (String) -> Void)
    func truncateTable(success: @escaping (String) -> Void, failure: @escaping (String) -> Void)
    func fetchRestaurant(restaurantID: String, success: @escaping (Restaurant) -> Void, failure: @escaping (String) -> Void)
}
