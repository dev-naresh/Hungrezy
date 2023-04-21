//
//  FoodDataDatabaseContract.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 13/04/23.
//

import Foundation

protocol FoodDataDatabaseContract {
    func createFoodTable(success: @escaping (String) -> Void, failure: @escaping (String) -> Void)
    func insertIntoFoodTable(food: Food, success: @escaping (Food) -> Void, failure: @escaping (String) -> Void)
    func fetchFood(filters: [String], success: @escaping ([Food]) -> Void, failure: @escaping (String) -> Void)
}
