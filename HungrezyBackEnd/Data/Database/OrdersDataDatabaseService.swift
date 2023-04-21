//
//  OrdersDataDatabaseService.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 19/04/23.
//

import Foundation
import SQLite3

class OrdersDataDatabaseService {
    var DB: OpaquePointer?
    var dbUrl: URL
    
    init() {
        self.dbUrl = try! FileManager.default.url(for: .documentDirectory, in: .allDomainsMask, appropriateFor: nil, create: false).appendingPathComponent("hungrezy.sqlite")
        print(dbUrl.path)
        if sqlite3_open(dbUrl.path, &DB) == SQLITE_OK {
            print("Database connected successfully")
            createOrderTable(success: success, failure: failure)
        }
        else {
            print("Database failed to connect")
        }
    }
    
    private func success(message: String) {
        print(message)
    }
    
    private func failure(message: String) {
        print(message)
    }
}

extension OrdersDataDatabaseService : OrdersDataDatabaseContract {
    func createOrderTable(success: @escaping (String) -> Void, failure: @escaping (String) -> Void) {
        var statement: OpaquePointer?
        let query = "CREATE TABLE if not exists Orders ( orderID TEXT, userID TEXT, restaurantID TEXT,  foodIDs TEXT, quantities TEXT, cartTotal INTEGER, gst INTEGER, packingFee INTEGER, deliveryFee INTEGER, grandTotal INTEGER );"
        if sqlite3_prepare(DB, query, -1, &statement, nil) == SQLITE_OK{
            if sqlite3_step(statement) == SQLITE_DONE{
                success("Orders table created")
            } else {
                failure("Orders table not created")
            }
        } else {
            failure("Orders table not created \(sqlite3_errmsg(DB)!)")
        }
        sqlite3_finalize(statement)
    }
    
    func insertIntoOrderTable(order: Order, success: @escaping (Order) -> Void, failure: @escaping (String) -> Void) {
        var statement: OpaquePointer?
        let query = """
        insert into Orders ("orderID", "userID", "restaurantID", "foodIDs", "quantities", "cartTotal", "gst", "packingFee", "deliveryFee", "grandTotal") values("\(order.orderID)", "\(order.userID)", "\(order.restaurantID)", "\(ArrayStringConversions.stringArrayToString(order.foodIDs))", "\(ArrayStringConversions.intArrayToString(order.quantities))", "\(order.cartTotal)", "\(order.gst)", "\(order.packingFee)", "\(order.deliveryFee)", "\(order.grandTotal)");
        """
        
        if sqlite3_prepare(DB, query, -1, &statement, nil) == SQLITE_OK{
            if sqlite3_step(statement) == SQLITE_DONE{
                success(order)
            } else {
                failure("Order not added")
            }
        } else {
            failure("Order not added")
        }
        sqlite3_finalize(statement)
    }
    
    private func fetchOrder(query: String, success: @escaping ([Order]) -> Void, failure: @escaping (String) -> Void) {
        var statement: OpaquePointer?
        var orders: [Order] = []
        if sqlite3_prepare(DB, query, -1, &statement, nil) == SQLITE_OK{
            while sqlite3_step(statement) == SQLITE_ROW {
                let orderID = String(cString: sqlite3_column_text(statement, 0))
                let userID = String(cString: sqlite3_column_text(statement, 1))
                let restaurantID = String(cString: sqlite3_column_text(statement, 2))
                let foodIDs = String(cString: sqlite3_column_text(statement, 3))
                let quantities = String(cString: sqlite3_column_text(statement, 4))
                let cartTotal = sqlite3_column_int(statement, 5)
                let gst = sqlite3_column_int(statement, 6)
                let packingFee = sqlite3_column_int(statement, 7)
                let deliveryFee = sqlite3_column_int(statement, 8)
                let grandTotal = sqlite3_column_int(statement, 9)
                
                let order = Order(orderID: orderID, userID: userID, restaurantID: restaurantID, foodIDs: ArrayStringConversions.stringToStringArray(foodIDs), quantities: ArrayStringConversions.stringToIntArray(quantities), cartTotal: Int(cartTotal), gst: Int(gst), packingFee: Int(packingFee), deliveryFee: Int(deliveryFee), grandTotal: Int(grandTotal))
                
                orders.append(order)
            }
            success(orders)
        } else {
            failure("Failed to fetch data")
        }
        sqlite3_finalize(statement)
    }
    
    func fetchOrder(userID: String, success: @escaping ([Order]) -> Void, failure: @escaping (String) -> Void) {
        let query = "select * from Orders where userID=\"\(userID)\";"
        print(query)
        fetchOrder(query: query, success: success, failure: failure)
    }
    
    func fetchOrder(restaurantID: String, success: @escaping ([Order]) -> Void, failure: @escaping (String) -> Void) {
        let query = "select * from Orders where restaurantID=\"\(restaurantID)\";"
        print(query)
        fetchOrder(query: query, success: success, failure: failure)
    }
    
    func truncateTable(success: @escaping (String) -> Void, failure: @escaping (String) -> Void) {
        var statement: OpaquePointer?
        let query = "delete from Orders;"
        if sqlite3_prepare(DB, query, -1, &statement, nil) == SQLITE_OK {
            if sqlite3_step(statement) == SQLITE_DONE{
                success("Table truncated")
            } else {
                failure("Failed to truncate")
            }
        } else {
            failure("Failed to truncate")
        }
        sqlite3_finalize(statement)
    }
}
