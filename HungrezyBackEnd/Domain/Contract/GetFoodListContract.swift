//
//  GetFoodListContract.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 13/04/23.
//

import Foundation

protocol GetFoodListContract {
    func getFoodList(filters: [String], success: @escaping ([Food]) -> Void, failure: @escaping (GetFoodListError) -> Void)
}
