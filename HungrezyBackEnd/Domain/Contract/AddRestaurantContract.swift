//
//  AddRestaurantContract.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 10/04/23.
//

import Foundation

protocol AddRestaurantContract {
    func addRestaurant(restaurant: Restaurant, success: @escaping (Restaurant) -> Void, failure: @escaping (AddRestaurantError) -> Void)
}
