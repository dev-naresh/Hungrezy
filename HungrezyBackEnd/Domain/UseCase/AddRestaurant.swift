//
//  AddRestaurant.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 10/04/23.
//

import Foundation

final class AddRestaurantRequest: Request {
    var restaurant: Restaurant
    init(restaurant: Restaurant) {
        self.restaurant = restaurant
        super.init(id: restaurant.id)
    }
}

final class AddRestaurantResponse: Response {
    
}

final class AddRestaurantError: Error {
    
}

class AddRestaurant: UseCase<AddRestaurantRequest, AddRestaurantResponse, AddRestaurantError> {
    var dataManager: AddRestaurantContract
    
    init(dataManager: AddRestaurantContract) {
        self.dataManager = dataManager
    }
    
    override func run(request: AddRestaurantRequest, success: @escaping (AddRestaurantResponse) -> Void, failure: @escaping (AddRestaurantError) -> Void){
        dataManager.addRestaurant(restaurant: request.restaurant, success: { [weak self] (restaurant) in
            self?.success(restaurant: restaurant, callBack: success)
        }, failure: { [weak self] (error) in
            self?.failure(error: error, callBack: failure)
        })
    }
    
    private func success(restaurant: Restaurant, callBack: @escaping (AddRestaurantResponse) -> Void) {
        let response = AddRestaurantResponse()
        invokeSuccess(callback: callBack, response: response)
    }
    
    private func failure(error: AddRestaurantError ,callBack: @escaping (AddRestaurantError) -> Void){
        invokeFailure(callback: callBack, failure: error)
    }
}
