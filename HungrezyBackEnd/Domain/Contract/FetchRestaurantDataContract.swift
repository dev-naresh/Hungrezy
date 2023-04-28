//
//  FetchRestaurantDataContract.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 27/04/23.
//

import Foundation

protocol FetchRestaurantDataContract {
    func fetchRestaurantData(restaurantID: String, success: @escaping (Restaurant) -> Void, failure: @escaping (FetchRestaurantDataError) -> Void)
}
