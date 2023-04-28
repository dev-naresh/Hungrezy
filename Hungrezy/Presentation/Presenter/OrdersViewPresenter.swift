//
//  OrdersViewPresenter.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 26/04/23.
//

import Foundation

class OrdersViewPresenter {
    weak var view: OrdersViewContract?
    var fetchUserOrders: FetchUserOrders
    var fetchRestaurantData: FetchRestaurantData
    var getImage: GetImage
    weak var router: OrdersViewRouterContract?
    
    init(fetchUserOrders: FetchUserOrders, fetchRestaurantData: FetchRestaurantData, getImage: GetImage) {
        self.fetchUserOrders = fetchUserOrders
        self.fetchRestaurantData = fetchRestaurantData
        self.getImage = getImage
    }
    
    func updateRestaurantData(restaurant: Restaurant) {
        view?.updateRestaurantData(restaurant: restaurant)
    }
    
    func fetchOrderResult(orders: [Order]) {
        view?.updateOrdersList(orders: orders)
    }
    
    func getImageResult(index: Int, imageData: Data) {
        view?.updateRestaurantImage(index: index, imageData: imageData)
    }
    
    func executionFailed(error: Error) {
        print(error)
    }
}

extension OrdersViewPresenter : OrdersViewPresenterContract {
    func addRestaurantInfo(restaurantID: String) {
        let request = FetchRestaurantDataRequest(restaurantID: restaurantID)
        fetchRestaurantData.execute(request: request, onSuccess: { [weak self] (response) in
            self?.updateRestaurantData(restaurant: response.restaurant)
        }, onFailure: { [weak self] (error) in
            self?.executionFailed(error: error)
        })
    }
    
    func getOrdersList(user: User) {
        let request = FetchUserOrdersRequest(userID: user.id)
        fetchUserOrders.execute(request: request, onSuccess: { [weak self] (response) in
            self?.fetchOrderResult(orders: response.orders)
        }, onFailure: { [weak self] (error) in
            self?.executionFailed(error: error)
        })
    }
    
    func getRestaurantImageData(index: Int, imageUrl: String) {
        let request = GetImageRequest(imageUrl: imageUrl)
        getImage.execute(request: request, onSuccess: { [weak self] (response) in
            self?.getImageResult(index: index, imageData: response.imageData)
        }, onFailure: { [weak self] (error) in
            self?.executionFailed(error: error)
        })
    }
}

