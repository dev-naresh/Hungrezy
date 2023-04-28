//
//  RestaurantDataNetworkContract.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 08/04/23.
//

import Foundation

protocol RestaurantDataNetworkContract {
    func addRestaurant(restaurant: Restaurant, success: @escaping (Restaurant) -> Void, failure: @escaping (String) -> Void)
    func fetchRestaurantInfo(city: Location, success: @escaping ([Restaurant]) -> Void, failure: @escaping (String) -> Void)
    func fetchRestaurantInfo(restaurantID: String, success: @escaping (Restaurant) -> Void, failure: @escaping (String) -> Void)
}
