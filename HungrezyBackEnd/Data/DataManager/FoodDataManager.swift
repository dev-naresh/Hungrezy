//
//  FoodDataManager.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 13/04/23.
//

import Foundation

class FoodDataManager {
    var database: FoodDataDatabaseContract
    var network: FoodDataNetworkContract
    
    init(database: FoodDataDatabaseContract, network: FoodDataNetworkContract) {
        self.database = database
        self.network = network
    }
    
    private func success(foods: [Food], callback: ([Food]) -> Void) {
        callback(foods)
    }
    
    private func success(food: Food, callback: (Food) -> Void) {
        callback(food)
    }
    
    private func success(message: String, callback: (String) -> Void) {
        callback(message)
    }
    
    private func failure(message: String, callback: ((AddFoodError) -> Void)) {
        if message == "No Data" {
            let error = AddFoodError(status: .networkUnavailable)
            callback(error)
        } else if message == "Failed to fetch data" {
            let error = AddFoodError(status: .authenticationFailure)
            callback(error)
        }
    }

    private func failure(message: String, callback: ((GetFoodListError) -> Void)) {
        if message == "No Data" {
            let error = GetFoodListError(status: .networkUnavailable)
            callback(error)
        } else if message == "Failed to fetch data" {
            let error = GetFoodListError(status: .authenticationFailure)
            callback(error)
        }
    }
    
    private func failure(message: String, callback: (String) -> Void) {
        callback(message)
    }
}

extension FoodDataManager : AddFoodContract {
    func addFood(food: Food, success: @escaping (Food) -> Void, failure: @escaping (AddFoodError) -> Void) {
        network.addFood(food: food, success: { [weak self] (food) in
            self?.success(food: food, callback: success)
        }, failure: { [weak self] (message) in
            self?.failure(message: message, callback: failure)
        })
    }
}

extension FoodDataManager : GetFoodListContract {
    func getFoodList(filters: [String], success: @escaping ([Food]) -> Void, failure: @escaping (GetFoodListError) -> Void) {
        DispatchQueue.main.async {
            self.database.fetchFood(filters: filters, success: { [weak self] (foods) in
                self?.success(foods: foods, callback: success)
            }, failure: { [weak self] (message) in
                self?.failure(message: message, callback: failure)
            })
        }
    }
}
