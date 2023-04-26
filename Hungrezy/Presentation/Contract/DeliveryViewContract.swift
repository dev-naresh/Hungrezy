//
//  DeliveryViewContract.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 07/04/23.
//

import Foundation

protocol DeliveryViewContract: AnyObject {
    func updateRestaurantsData(restaurants: [Restaurant])
    func updateRestaurantImage(row: Int, imageData: Data)
    func applyFilters(starRatingAbove ratings: Float, isPureVegeterian: Bool, isChettinad: Bool, isChinese: Bool, isContinental: Bool, isIndian: Bool, isItalian: Bool, isBiryani: Bool, isStreetFood: Bool)
    func applySorting(by sortingType: SortingType)
}
