//
//  OrdersViewContract.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 26/04/23.
//

import Foundation

protocol OrdersViewContract: AnyObject {
    func updateOrdersList(orders: [Order])
    func updateRestaurantData(restaurant: Restaurant)
    func updateRestaurantImage(index: Int, imageData: Data)
}
