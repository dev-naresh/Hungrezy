//
//  FoodListPresenterContract.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 24/04/23.
//

import Foundation

protocol FoodListPresenterContract: AnyObject {
    func getFoodImageData(index: Int, imageUrl: String)
}
