//
//  FetchRestaurantOrders.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 19/04/23.
//

import Foundation

final class FetchRestaurantOrdersRequest: Request {
    init(restaurantID: String) {
        super.init(id: restaurantID)
    }
}

final class FetchRestaurantOrdersResponse: Response {
    var orders: [Order]
    
    init(orders: [Order]) {
        self.orders = orders
    }
}

final class FetchRestaurantOrdersError: Error {
    
}

class FetchRestaurantOrders : UseCase<FetchRestaurantOrdersRequest, FetchRestaurantOrdersResponse, FetchRestaurantOrdersError> {
    var dataManager: FetchRestaurantOrdersContract
    
    init(dataManager: FetchRestaurantOrdersContract) {
        self.dataManager = dataManager
    }
    
    override func run(request: FetchRestaurantOrdersRequest, success: @escaping (FetchRestaurantOrdersResponse) -> Void, failure: @escaping (FetchRestaurantOrdersError) -> Void) {
        
        guard let id = request.id else {
            return
        }
        
        dataManager.getOrders(restaurantID: id, success: { [weak self] (orders) in
            self?.success(orders: orders, callBack: success)
        }, failure: { [weak self] (error) in
            self?.failure(error: error, callBack: failure)
        })
    }
    
    func success(orders: [Order], callBack: @escaping (FetchRestaurantOrdersResponse) -> Void){
        let response = FetchRestaurantOrdersResponse(orders: orders)
        invokeSuccess(callback: callBack, response: response)
    }
    
    func failure(error: FetchRestaurantOrdersError, callBack: @escaping (FetchRestaurantOrdersError) -> Void){
        invokeFailure(callback: callBack, failure: error)
    }
}
