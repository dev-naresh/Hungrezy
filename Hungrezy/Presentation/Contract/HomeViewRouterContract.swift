//
//  HomeViewRouterContract.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 06/04/23.
//

import Foundation

protocol HomeViewRouterContract: AnyObject {
    func loadDeliveryModule(location: Location)
    func loadDineOutModule(location: Location)
    func loadBlogModule(location: Location)
    func loadOrdersModule()
}
