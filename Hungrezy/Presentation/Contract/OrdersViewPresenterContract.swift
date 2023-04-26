//
//  OrdersViewPresenterContract.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 26/04/23.
//

import Foundation

protocol OrdersViewPresenterContract: AnyObject {
    func getOrdersList(user: User)
//    func getOrderDetails(orderID: String)
}
