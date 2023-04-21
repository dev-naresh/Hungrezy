//
//  AddOrder.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 19/04/23.
//

import Foundation

final class AddOrderRequest: Request {
    var order: Order
    init(order: Order) {
        self.order = order
        super.init(id: order.orderID)
    }
}

final class AddOrderResponse: Response {
    
}

final class AddOrderError: Error {
    
}

class AddOrder: UseCase<AddOrderRequest, AddOrderResponse, AddOrderError> {
    var dataManager: AddOrderContract
    
    init(dataManager: AddOrderContract) {
        self.dataManager = dataManager
    }
    
    override func run(request: AddOrderRequest, success: @escaping (AddOrderResponse) -> Void, failure: @escaping (AddOrderError) -> Void){
        dataManager.addOrder(order: request.order, success: { [weak self] (order) in
            self?.success(order: order, callBack: success)
        }, failure: { [weak self] (error) in
            self?.failure(error: error, callBack: failure)
        })
    }
    
    private func success(order: Order, callBack: @escaping (AddOrderResponse) -> Void) {
        let response = AddOrderResponse()
        invokeSuccess(callback: callBack, response: response)
    }
    
    private func failure(error: AddOrderError ,callBack: @escaping (AddOrderError) -> Void){
        invokeFailure(callback: callBack, failure: error)
    }
}
