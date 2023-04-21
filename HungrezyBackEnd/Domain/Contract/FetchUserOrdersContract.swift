//
//  FetchUserOrdersContract.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 19/04/23.
//

import Foundation

protocol FetchUserOrdersContract {
    func getOrders(userID: String, success: @escaping ([Order]) -> Void, failure: @escaping (FetchUserOrdersError) -> Void)
}
