//
//  GetRestaurantList.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 10/04/23.
//

import Foundation

final class GetRestaurantListRequest: Request {
    var filters: [String]
    init(filters: [String]) {
        self.filters = filters
        super.init()
    }
}

final class GetRestaurantListResponse: Response {
    var restaurants: [Restaurant]
    
    init(restaurants: [Restaurant]) {
        self.restaurants = restaurants
    }
}

final class GetRestaurantListError: Error {
    
}

class GetRestaurantList : UseCase<GetRestaurantListRequest, GetRestaurantListResponse, GetRestaurantListError> {
    var dataManager: GetRestaurantListContract
    
    init(dataManager: GetRestaurantListContract) {
        self.dataManager = dataManager
    }
    
    override func run(request: GetRestaurantListRequest, success: @escaping (GetRestaurantListResponse) -> Void, failure: @escaping (GetRestaurantListError) -> Void) {
        dataManager.getRestaurantList(filters: request.filters, success: { [weak self] (restaurants) in
            self?.success(restaurants: restaurants, callBack: success)
        }, failure: { [weak self] (error) in
            self?.failure(error: error, callBack: failure)
        })
    }
    
    func success(restaurants: [Restaurant], callBack: @escaping (GetRestaurantListResponse) -> Void){
        let response = GetRestaurantListResponse(restaurants: restaurants)
        invokeSuccess(callback: callBack, response: response)
    }
    
    func failure(error: GetRestaurantListError, callBack: @escaping (GetRestaurantListError) -> Void){
        invokeFailure(callback: callBack, failure: error)
    }
}
