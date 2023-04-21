//
//  AddFoodContract.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 13/04/23.
//

import Foundation

protocol AddFoodContract {
    func addFood(food: Food, success: @escaping (Food) -> Void, failure: @escaping (AddFoodError) -> Void)
}
