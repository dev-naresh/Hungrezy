//
//  OrdersDataManager.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 19/04/23.
//

import Foundation

class OrdersDataManager {
    var database: OrdersDataDatabaseContract
    var network: OrdersDataNetworkContract
    
    init(database: OrdersDataDatabaseContract, network: OrdersDataNetworkContract) {
        self.database = database
        self.network = network
    }
    
    private func success(orders: [Order], callback: ([Order]) -> Void) {
        callback(orders)
    }
    
    private func success(order: Order, callback: (Order) -> Void) {
        callback(order)
    }
    
    private func success(message: String, callback: (String) -> Void) {
        callback(message)
    }
    
    private func failure(message: String, callback: ((AddOrderError) -> Void)) {
        if message == "No Data" {
            let error = AddOrderError(status: .networkUnavailable)
            callback(error)
        } else if message == "Failed to fetch data" {
            let error = AddOrderError(status: .authenticationFailure)
            callback(error)
        }
    }

    private func failure(message: String, callback: ((FetchUserOrdersError) -> Void)) {
        if message == "No Data" {
            let error = FetchUserOrdersError(status: .networkUnavailable)
            callback(error)
        } else if message == "Failed to fetch data" {
            let error = FetchUserOrdersError(status: .authenticationFailure)
            callback(error)
        }
    }
    
    private func failure(message: String, callback: ((FetchRestaurantOrdersError) -> Void)) {
        if message == "No Data" {
            let error = FetchRestaurantOrdersError(status: .networkUnavailable)
            callback(error)
        } else if message == "Failed to fetch data" {
            let error = FetchRestaurantOrdersError(status: .authenticationFailure)
            callback(error)
        }
    }
    
    private func failure(message: String, callback: (String) -> Void) {
        callback(message)
    }
}

extension OrdersDataManager : AddOrderContract {
    func addOrder(order: Order, success: @escaping (Order) -> Void, failure: @escaping (AddOrderError) -> Void) {
        network.addOrder(order: order, success: { [weak self] (order) in
            self?.success(order: order, callback: success)
        }, failure: { [weak self] (message) in
            self?.failure(message: message, callback: failure)
        })
        
        database.insertIntoOrderTable(order: order, success: { [weak self] (order) in
            self?.success(order: order, callback: success)
        }, failure: { [weak self] (message) in
            self?.failure(message: message, callback: failure)
        })
    }
}

extension OrdersDataManager : FetchUserOrdersContract {
    func getOrders(userID: String, success: @escaping ([Order]) -> Void, failure: @escaping (FetchUserOrdersError) -> Void) {
        self.database.fetchOrder(userID: userID, success: { [weak self] (orders) in
            self?.success(orders: orders, callback: success)
        }, failure: { [weak self] (message) in
            self?.failure(message: message, callback: failure)
        })
        
        self.network.fetchOrderInfo(userID: userID, success: { [weak self] (orders) in
            self?.database.truncateTable(success: { (message) in
                self?.success(message: message, callback: { (message) in
                    print(message)
                })
            }, failure: { [weak self] (message) in
                self?.failure(message: message, callback: failure)
            })
            
            for order in orders {
                self?.database.insertIntoOrderTable(order: order, success: { order in
                    
                }, failure: { (message) in
                    print(message)
                })
            }
            
            self?.database.fetchOrder(userID: userID, success: { [weak self] (orders) in
                self?.success(orders: orders, callback: success)
            }, failure: { [weak self] (message) in
                self?.failure(message: message, callback: failure)
            })
        }, failure: { [weak self] (message) in
            self?.failure(message: message, callback: failure)
        })
    }
}

extension OrdersDataManager : FetchRestaurantOrdersContract {
    func getOrders(restaurantID: String, success: @escaping ([Order]) -> Void, failure: @escaping (FetchRestaurantOrdersError) -> Void) {
        self.database.fetchOrder(restaurantID: restaurantID, success: { [weak self] (orders) in
            self?.success(orders: orders, callback: success)
        }, failure: { [weak self] (message) in
            self?.failure(message: message, callback: failure)
        })
        
        self.network.fetchOrderInfo(restaurantID: restaurantID, success: { [weak self] (orders) in
            self?.database.truncateTable(success: { (message) in
                self?.success(message: message, callback: { (message) in
                    print(message)
                })
            }, failure: { [weak self] (message) in
                self?.failure(message: message, callback: failure)
            })
            
            for order in orders {
                self?.database.insertIntoOrderTable(order: order, success: { order in
                    
                }, failure: { (message) in
                    print(message)
                })
            }
            
            self?.database.fetchOrder(restaurantID: restaurantID, success: { [weak self] (orders) in
                self?.success(orders: orders, callback: success)
            }, failure: { [weak self] (message) in
                self?.failure(message: message, callback: failure)
            })
        }, failure: { [weak self] (message) in
            self?.failure(message: message, callback: failure)
        })
    }
}
