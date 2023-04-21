//
//  OrdersDataDatabaseContract.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 19/04/23.
//

import Foundation

protocol OrdersDataDatabaseContract {
    func createOrderTable(success: @escaping (String) -> Void, failure: @escaping (String) -> Void)
    func insertIntoOrderTable(order: Order, success: @escaping (Order) -> Void, failure: @escaping (String) -> Void)
    func fetchOrder(userID: String, success: @escaping ([Order]) -> Void, failure: @escaping (String) -> Void)
    func fetchOrder(restaurantID: String, success: @escaping ([Order]) -> Void, failure: @escaping (String) -> Void)
    func truncateTable(success: @escaping (String) -> Void, failure: @escaping (String) -> Void)
}
