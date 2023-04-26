//
//  OrdersDataNetworkContract.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 19/04/23.
//

import Foundation

protocol OrdersDataNetworkContract {
    func addOrder(order: Order, success: @escaping ([Order]) -> Void, failure: @escaping (String) -> Void)
    func fetchOrderInfo(userID: String, success: @escaping ([Order]) -> Void, failure: @escaping (String) -> Void)
    func fetchOrderInfo(restaurantID: String, success: @escaping ([Order]) -> Void, failure: @escaping (String) -> Void)
}
