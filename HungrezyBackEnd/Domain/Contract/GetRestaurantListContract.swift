//
//  GetRestaurantList.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 10/04/23.
//

import Foundation

protocol GetRestaurantListContract {
    func getRestaurantList(filters: [String], success: @escaping ([Restaurant]) -> Void, failure: @escaping (GetRestaurantListError) -> Void)
}
