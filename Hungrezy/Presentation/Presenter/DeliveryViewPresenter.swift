//
//  DeliveryViewPresenter.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 07/04/23.
//

import Foundation

class DeliveryViewPresenter {
    weak var view: DeliveryViewContract?
    var getRestaurantList: GetRestaurantList
    weak var router: DeliveryViewRouterContract?
    
    init(getRestaurantList: GetRestaurantList) {
        self.getRestaurantList = getRestaurantList
    }
    
    func getRestaurantListResult(restaurants: [Restaurant]) {
        view?.updateRestaurantsData(restaurants: restaurants)
    }
    
    func getRestaurantListFailed(error: Error) {
        print(error)
    }
    
}

extension DeliveryViewPresenter : DeliveryViewPresenterContract {
    func getMenuView(restaurant: Restaurant) {
        router?.loadMenuView(restaurant: restaurant)
    }
    
    func getRestaurantsList(filters: [String]) {
        let request = GetRestaurantListRequest(filters: filters)
        getRestaurantList.execute(request: request, onSuccess: { [weak self] (response) in
            self?.getRestaurantListResult(restaurants: response.restaurants)
        }, onFailure: { [weak self] (error) in
            self?.getRestaurantListFailed(error: error)
        })
    }
}
