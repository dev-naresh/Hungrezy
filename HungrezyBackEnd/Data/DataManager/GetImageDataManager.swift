//
//  GetImageDataManager.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 24/04/23.
//

import Foundation

class GetImageDataManager {
    var network: GetImageNetworkContract
    
    init(network: GetImageNetworkContract) {
        self.network = network
    }
    
    private func success(imageData: Data, callback: (Data) -> Void) {
        callback(imageData)
    }
    
    private func failure(error: Error?, callback: ((GetImageError) -> Void)) {
        callback(GetImageError(status: .unknownError))
    }

    private func failure(message: String, callback: (String) -> Void) {
        callback(message)
    }
}

extension GetImageDataManager : GetImageContract {
    func getImage(imageUrl: String, success: @escaping (Data) -> Void, failure: @escaping (GetImageError) -> Void) {
        network.getImage(from: imageUrl, success: { (data) in
            self.success(imageData: data, callback: success)
        }, failure: { (error) in
            self.failure(error: error, callback: failure)
        })
    }
}
