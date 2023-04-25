//
//  GetImage.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 24/04/23.
//

import Foundation

final class GetImageRequest: Request {
    var imageUrl: String
    init(imageUrl: String) {
        self.imageUrl = imageUrl
        super.init()
    }
}

final class GetImageResponse: Response {
    var imageData: Data
    
    init(imageData: Data) {
        self.imageData = imageData
    }
}

final class GetImageError: Error {
    
}

class GetImage : UseCase<GetImageRequest, GetImageResponse, GetImageError> {
    var dataManager: GetImageContract
    
    init(dataManager: GetImageContract) {
        self.dataManager = dataManager
    }
    
    override func run(request: GetImageRequest, success: @escaping (GetImageResponse) -> Void, failure: @escaping (GetImageError) -> Void) {
        dataManager.getImage(imageUrl: request.imageUrl, success: { [weak self] (imageData) in
            self?.success(imageData: imageData, callBack: success)
        }, failure: { [weak self] (error) in
            self?.failure(error: error, callBack: failure)
        })
    }
    
    func success(imageData: Data, callBack: @escaping (GetImageResponse) -> Void){
        let response = GetImageResponse(imageData: imageData)
        invokeSuccess(callback: callBack, response: response)
    }
    
    func failure(error: GetImageError, callBack: @escaping (GetImageError) -> Void){
        invokeFailure(callback: callBack, failure: error)
    }
}
