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
    var getImage: GetImage
    weak var router: DeliveryViewRouterContract?
    
    init(getRestaurantList: GetRestaurantList, getImage: GetImage) {
        self.getRestaurantList = getRestaurantList
        self.getImage = getImage
    }
    
    func getImageResult(index: Int, imageData: Data) {
        view?.updateRestaurantImage(row: index, imageData: imageData)
    }
    
    func getFoodImageFailed(error: Error) {
        print(error)
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
    
    func getFoodImageData(index: Int, imageUrl: String) {
        let request = GetImageRequest(imageUrl: imageUrl)
        getImage.execute(request: request, onSuccess: { [weak self] (response) in
            self?.getImageResult(index: index, imageData: response.imageData)
        }, onFailure: { [weak self] (error) in
            self?.getFoodImageFailed(error: error)
        })
    }
}
