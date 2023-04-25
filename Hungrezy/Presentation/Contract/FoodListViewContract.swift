//
//  FoodListViewContract.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 24/04/23.
//

import Foundation

protocol FoodListViewContract: AnyObject {
//    func addItemToCart(food: Food)
//    func removeItemFromCart(food: Food)
    func updateImage(row: Int, imageData: Data)
}
