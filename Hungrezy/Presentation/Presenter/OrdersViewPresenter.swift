//
//  OrdersViewPresenter.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 26/04/23.
//

import Foundation

class OrdersViewPresenter {
    weak var view: OrdersViewContract?
    var fetchUserOrders: FetchUserOrders
    weak var router: OrdersViewRouterContract?
    
    init(fetchUserOrders: FetchUserOrders) {
        self.fetchUserOrders = fetchUserOrders
    }
    
    func fetchOrderResult(orders: [Order]) {
        print(orders)
    }
    
    func fetchOrderFailed(error: Error) {
        print(error)
    }
}

extension OrdersViewPresenter : OrdersViewPresenterContract {
    func getOrdersList(user: User) {
        let request = FetchUserOrdersRequest(userID: user.id)
        fetchUserOrders.execute(request: request, onSuccess: { [weak self] (response) in
            self?.fetchOrderResult(orders: response.orders)
        }, onFailure: { [weak self] (error) in
            self?.fetchOrderFailed(error: error)
        })
    }
}
