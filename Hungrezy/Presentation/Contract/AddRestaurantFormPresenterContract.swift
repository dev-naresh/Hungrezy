//
//  AddRestaurantFormPresenterContract.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 11/04/23.
//

import Foundation

protocol AddRestaurantFormPresenterContract: AnyObject {
    func closeAddRestaurantSheet()
    func addNewRestaurant(restaurant: Restaurant)
}
