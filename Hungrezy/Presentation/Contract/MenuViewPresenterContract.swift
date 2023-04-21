//
//  MenuViewPresenterContract.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 17/04/23.
//

import Foundation

protocol MenuViewPresenterContract: AnyObject {
    func getFoodsList(filters: [String])
    func launchOrdersModule()
    func relaunchMenuView(restaurant: Restaurant)
}
