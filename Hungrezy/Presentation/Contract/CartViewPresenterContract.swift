//
//  CartViewPresenterContract.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 26/04/23.
//

import Foundation

protocol CartViewPresenterContract: AnyObject {
    func relaunchMenuView(restaurant: Restaurant)
    func addNewOrder(order: Order)
    func getUser() -> User
}
