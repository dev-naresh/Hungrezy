//
//  MenuViewPresenter.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 17/04/23.
//

import Foundation

class MenuViewPresenter {
    weak var view: MenuViewContract?
    var getFoodList: GetFoodList
    weak var router: MenuViewRouterContract?
    
    init(getFoodList: GetFoodList) {
        self.getFoodList = getFoodList
    }
    
    func getFoodListResult(foods: [Food]) {
        view?.updateFoodsData(foods: foods)
    }
    
    func getFoodListFailed(error: Error) {
        print(error)
    }
}

extension MenuViewPresenter : MenuViewPresenterContract {
    func applySorting(by sortingType: SortingType) {
        view?.applySorting(by: sortingType)
    }
    
    func launchOrdersModule() {
        router?.launchOrdersModule()
    }
    
    func relaunchMenuView(restaurant: Restaurant) {
        router?.loadMenuView(restaurant: restaurant)
    }
    
    func getFoodsList(filters: [String]) {
        let request = GetFoodListRequest(filters: filters)
        getFoodList.execute(request: request, onSuccess: { [weak self] (response) in
            self?.getFoodListResult(foods: response.foods)
        }, onFailure: { [weak self] (error) in
            self?.getFoodListFailed(error: error)
        })
    }
    
    func applyFiters(starRatingAbove: Float, isPureVegeterian: Bool, isChettinad: Bool, isChinese: Bool, isContinental: Bool, isIndian: Bool, isItalian: Bool, isBiryani: Bool, isStreetFood: Bool) {
        view?.applyFiters(starRatingAbove: starRatingAbove, isPureVegeterian: isPureVegeterian, isChettinad: isChettinad, isChinese: isChinese, isContinental: isContinental, isIndian: isIndian, isItalian: isItalian, isBiryani: isBiryani, isStreetFood: isStreetFood)
    }
}
