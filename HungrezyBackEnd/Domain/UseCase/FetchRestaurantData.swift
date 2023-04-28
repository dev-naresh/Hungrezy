//
//  FetchRestaurantData.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 27/04/23.
//

import Foundation

final class FetchRestaurantDataRequest: Request {
    var restaurantID: String
    init(restaurantID: String) {
        self.restaurantID = restaurantID
        super.init()
    }
}

final class FetchRestaurantDataResponse: Response {
    var restaurant: Restaurant
    
    init(restaurant: Restaurant) {
        self.restaurant = restaurant
    }
}

final class FetchRestaurantDataError: Error {
    
}

class FetchRestaurantData : UseCase<FetchRestaurantDataRequest, FetchRestaurantDataResponse, FetchRestaurantDataError> {
    var dataManager: FetchRestaurantDataContract
    
    init(dataManager: FetchRestaurantDataContract) {
        self.dataManager = dataManager
    }
    
    override func run(request: FetchRestaurantDataRequest, success: @escaping (FetchRestaurantDataResponse) -> Void, failure: @escaping (FetchRestaurantDataError) -> Void) {
        dataManager.fetchRestaurantData(restaurantID: request.restaurantID, success: { [weak self] (restaurant) in
            self?.success(restaurant: restaurant, callBack: success)
        }, failure: { [weak self] (error) in
            self?.failure(error: error, callBack: failure)
        })
    }
    
    func success(restaurant: Restaurant, callBack: @escaping (FetchRestaurantDataResponse) -> Void){
        let response = FetchRestaurantDataResponse(restaurant: restaurant)
        invokeSuccess(callback: callBack, response: response)
    }
    
    func failure(error: FetchRestaurantDataError, callBack: @escaping (FetchRestaurantDataError) -> Void){
        invokeFailure(callback: callBack, failure: error)
    }
}
