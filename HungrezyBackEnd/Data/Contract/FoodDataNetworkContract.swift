//
//  FoodDataNetworkContract.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 13/04/23.
//

import Foundation

protocol FoodDataNetworkContract {
    func addFood(food: Food, success: @escaping (Food) -> Void, failure: @escaping (String) -> Void)
    func fetchFoodInfo(restaurantID: String, success: @escaping ([Food]) -> Void, failure: @escaping (String) -> Void)
}
