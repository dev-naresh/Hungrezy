//
//  ModulePresenterContract.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 07/04/23.
//

import Foundation

protocol ModulePresenterContract {
    func loadDeliveryModule(location: Location)
    func loadDineOutModule(location: Location)
    func loadBlogModule(location: Location)
    func loadOrdersModule()
}
