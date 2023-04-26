//
//  DeliveryViewPresenterContract.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 07/04/23.
//

import Foundation

protocol DeliveryViewPresenterContract: AnyObject {
    func getMenuView(restaurant: Restaurant)
    func getRestaurantsList(filters: [String])
    func getFoodImageData(index: Int, imageUrl: String)
}
