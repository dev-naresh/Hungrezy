//
//  CartViewPresenter.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 26/04/23.
//

import Foundation

class CartViewPresenter {
    weak var view: CartViewContract?
    var addOrder: AddOrder
    weak var router: CartViewRouterContract?
    
    init(addOrder: AddOrder) {
        self.addOrder = addOrder
    }
    
    func addOrderResult() {
        print("LaunchedOrders")
        router?.launchOrdersModule()
    }
    
    func addOrderFailed(error: Error) {
        print(error)
    }
}

extension CartViewPresenter : CartViewPresenterContract {
    func getUser() -> User {
        return router!.getUser()
    }
    
    func relaunchMenuView(restaurant: Restaurant) {
        router?.loadMenuView(restaurant: restaurant)
    }
    
    func addNewOrder(order: Order) {
        let request = AddOrderRequest(order: order)
        addOrder.execute(request: request, onSuccess: { [weak self] (response) in
            self?.addOrderResult()
        }, onFailure: { [weak self] (error) in
            self?.addOrderFailed(error: error)
        })
    }

    func launchOrdersModule() {
        router?.launchOrdersModule()
    }
}
