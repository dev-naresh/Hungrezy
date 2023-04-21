//
//  FetchUserOrders.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 19/04/23.
//

import Foundation

final class FetchUserOrdersRequest: Request {
    init(userID: String) {
        super.init(id: userID)
    }
}

final class FetchUserOrdersResponse: Response {
    var orders: [Order]
    
    init(orders: [Order]) {
        self.orders = orders
    }
}

final class FetchUserOrdersError: Error {
    
}

class FetchUserOrders : UseCase<FetchUserOrdersRequest, FetchUserOrdersResponse, FetchUserOrdersError> {
    var dataManager: FetchUserOrdersContract
    
    init(dataManager: FetchUserOrdersContract) {
        self.dataManager = dataManager
    }
    
    override func run(request: FetchUserOrdersRequest, success: @escaping (FetchUserOrdersResponse) -> Void, failure: @escaping (FetchUserOrdersError) -> Void) {
        
        guard let id = request.id else {
            return
        }
        
        dataManager.getOrders(userID: id, success: { [weak self] (orders) in
            self?.success(orders: orders, callBack: success)
        }, failure: { [weak self] (error) in
            self?.failure(error: error, callBack: failure)
        })
    }
    
    func success(orders: [Order], callBack: @escaping (FetchUserOrdersResponse) -> Void){
        let response = FetchUserOrdersResponse(orders: orders)
        invokeSuccess(callback: callBack, response: response)
    }
    
    func failure(error: FetchUserOrdersError, callBack: @escaping (FetchUserOrdersError) -> Void){
        invokeFailure(callback: callBack, failure: error)
    }
}
