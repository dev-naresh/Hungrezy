//
//  CartViewRouterContract.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 26/04/23.
//

import Foundation

protocol CartViewRouterContract: AnyObject {
    func launchOrdersModule()
    func loadMenuView(restaurant: Restaurant)
    func getUser() -> User
}
