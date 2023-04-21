//
//  AddOrderContract.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 19/04/23.
//

import Foundation

protocol AddOrderContract {
    func addOrder(order: Order, success: @escaping (Order) -> Void, failure: @escaping (AddOrderError) -> Void)
}
