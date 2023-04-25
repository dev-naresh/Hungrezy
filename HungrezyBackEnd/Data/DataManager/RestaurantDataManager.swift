//
//  RestaurantDataManager.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 10/04/23.
//

import Foundation

class RestaurantDataManager {
    var database: RestaurantDataDatabaseContract
    var network: RestaurantDataNetworkContract
    
    init(database: RestaurantDataDatabaseContract, network: RestaurantDataNetworkContract) {
        self.database = database
        self.network = network
    }
    
    private func success(restaurants: [Restaurant], callback: ([Restaurant]) -> Void) {
        callback(restaurants)
    }
    
    private func success(restaurant: Restaurant, callback: (Restaurant) -> Void) {
        callback(restaurant)
    }
    
    private func success(message: String, callback: (String) -> Void) {
        callback(message)
    }
    
    private func failure(message: String, callback: ((AddRestaurantError) -> Void)) {
        if message == "No Data" {
            let error = AddRestaurantError(status: .networkUnavailable)
            callback(error)
        } else if message == "Failed to fetch data" {
            let error = AddRestaurantError(status: .authenticationFailure)
            callback(error)
        }
    }
    
    private func failure(message: String, callback: ((GetRestaurantListError) -> Void)) {
        if message == "No Data" {
            let error = GetRestaurantListError(status: .networkUnavailable)
            callback(error)
        } else if message == "Failed to fetch data" {
            let error = GetRestaurantListError(status: .authenticationFailure)
            callback(error)
        }
    }
    
    private func failure(message: String, callback: (String) -> Void) {
        callback(message)
    }
}

extension RestaurantDataManager : AddRestaurantContract {
    func addRestaurant(restaurant: Restaurant, success: @escaping (Restaurant) -> Void, failure: @escaping (AddRestaurantError) -> Void) {
        network.addRestaurant(restaurant: restaurant, success: { [weak self] (restaurant) in
            self?.success(restaurant: restaurant, callback: success)
        }, failure: { [weak self] (message) in
            self?.failure(message: message, callback: failure)
        })
    }
}

extension RestaurantDataManager : GetRestaurantListContract {
    func getRestaurantList(filters: [String], success: @escaping ([Restaurant]) -> Void, failure: @escaping (GetRestaurantListError) -> Void) {
//        network.fetchRestaurantInfo(city: <#T##Location#>, success: <#T##([Restaurant]) -> Void#>, failure: <#T##(String) -> Void#>)
        
        self.database.fetchRestaurants(filters: filters, success: { [weak self] (restaurants) in
            self?.success(restaurants: restaurants, callback: success)
        }, failure: { [weak self] (message) in
            self?.failure(message: message, callback: failure)
        })
    }
}
