//
//  FoodListViewPresenter.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 24/04/23.
//

import Foundation

class FoodListViewPresenter {
    weak var view: FoodListViewContract?
    var getImage: GetImage
    weak var router: FoodListRouterContract?
    
    init(getImage: GetImage) {
        self.getImage = getImage
    }
    
    func getImageResult(index: Int, imageData: Data) {
        view?.updateImage(row: index, imageData: imageData)
    }
    
    func getFoodImageFailed(error: Error) {
        print(error)
    }
}

extension FoodListViewPresenter : FoodListPresenterContract {
    func getFoodImageData(index: Int, imageUrl: String) {
        let request = GetImageRequest(imageUrl: imageUrl)
        getImage.execute(request: request, onSuccess: { [weak self] (response) in
            self?.getImageResult(index: index, imageData: response.imageData)
        }, onFailure: { [weak self] (error) in
            self?.getFoodImageFailed(error: error)
        })
    }
}
