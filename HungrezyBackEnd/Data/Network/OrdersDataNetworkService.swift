//
//  OrdersDataNetworkService.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 19/04/23.
//

import Foundation

class OrdersDataNetworkService {
    init() {
        
    }
}
 
extension OrdersDataNetworkService : OrdersDataNetworkContract {
    func addOrder(order: Order, success: @escaping ([Order]) -> Void, failure: @escaping (String) -> Void) {
        guard let url = URL(string: "https://642432664740174043357d2b.mockapi.io/order") else {
            print("Invalid link...")
            return
        }
        var req = URLRequest(url: url)
        req.httpMethod = "POST"
        req.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        req.httpBody = try? JSONEncoder().encode(order)
        let session = URLSession.shared.dataTask(with: req) {
            data, response, error in
            let resResult = response as? HTTPURLResponse
            print("Status code:",resResult?.statusCode ?? 0)
            if let error = error {
                print(error.localizedDescription)
                failure("Failed to connect")
            } else {
                self.fetchOrderInfo(userID: order.userID,
                success: { (order) in
                    success(order)
                }, failure: { (message) in
                    failure(message)
                })
            }
        }
        session.resume()
    }
    
    func fetchOrderInfo(userID: String, success: @escaping ([Order]) -> Void, failure: @escaping (String) -> Void) {
        guard let url = URL(string: "https://642432664740174043357d2b.mockapi.io/order?userID=\(userID)") else {
            print("Invalid link...")
            return
        }
        let req = URLRequest(url: url)
        let session = URLSession.shared.dataTask(with: req) {
            data, response, error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                if let data = data {
                    do {
                        let testObj = try JSONDecoder().decode([Order].self, from: data)
                        success(testObj)
                    } catch {
                        print(error)
                        failure("Failed to fetch")
                    }
                }
            }
        }
        session.resume()
    }
    
    func fetchOrderInfo(restaurantID: String, success: @escaping ([Order]) -> Void, failure: @escaping (String) -> Void) {
        guard let url = URL(string: "https://642432664740174043357d2b.mockapi.io/order?restaurantID=\(restaurantID)") else {
            print("Invalid link...")
            return
        }
        let req = URLRequest(url: url)
        let session = URLSession.shared.dataTask(with: req) {
            data, response, error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                if let data = data {
                    do {
                        let testObj = try JSONDecoder().decode([Order].self, from: data)
                        success(testObj)
                    } catch {
                        print(error)
                        failure("Failed to fetch")
                    }
                }
            }
        }
        session.resume()
    }
}
