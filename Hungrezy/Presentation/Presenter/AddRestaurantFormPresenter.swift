//
//  AddRestaurantFormPresenter.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 11/04/23.
//

import Foundation

class AddRestaurantFormPresenter {
    weak var view: AddRestaurantForm?
    var addRestaurant: AddRestaurant
    weak var router: AddRestaurantFormRouterContract?
    
    init(addRestaurant: AddRestaurant) {
        self.addRestaurant = addRestaurant
    }
    
    func addRestaurantResult() {
        print("Restaurant Added")
        router?.closeAddRestaurantWindow()
    }
    
    func addRestaurantFailed() {
        print("Add Restaurant Failed")
    }
}

extension AddRestaurantFormPresenter : AddRestaurantFormPresenterContract {
    func closeAddRestaurantSheet() {
        router?.closeAddRestaurantWindow()
    }
    
    func addNewRestaurant(restaurant: Restaurant) {
        let request = AddRestaurantRequest(restaurant: restaurant)
        addRestaurant.execute(request: request, onSuccess: { [weak self] (response) in
            self?.addRestaurantResult()
        }, onFailure: { [weak self] (error) in
            self?.addRestaurantFailed()
        })
    }
}
